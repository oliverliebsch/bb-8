## Lifecycle hooks
# created, mounted, updated, and destroyed… https://vuejs.org/images/lifecycle.png
# All lifecycle hooks are called with their this context pointing to the Vue instance invoking it

## Controllers
# There are no controllers. Your custom logic for a component would be split among lifecycle hooks.

## Computed properties vs. methods
# The difference is that computed properties are cached based on their dependencies.
# A computed property will only re-evaluate when some of its dependencies have changed.

# <template> serves as an invisible wrapper

# Prefer v-show if you need to toggle something very often, and prefer v-if if the condition is unlikely to change at runtime.

# z. T. Probleme mit haml:
# - .prevent o. ä. auf Attributen
# @ Kurzschreibweise


# Centralized event hub
eventHub = new Vue()

Controls = {
  template: '#template-controls'

  props: ['index']

  methods: {
    addBlock: (type) ->
      eventHub.$emit('bb8-add-block', { blocktype: type, index: this.index })
  }
}

blockMixin = {
  data: -> {
    block: this.initialData
  }

  props: ['blocks', 'initialData', 'index']

  components: {
    'controls': Controls
  }

  created: ->
    debugger

  methods: {
    updateText: (text) ->
      this.block.text = text
      this.$emit('bb8-update-block', this.block)
  }
}

Heading = {
  template: '#template-heading'

  mixins: [blockMixin]
}

Subheading = {
  template: '#template-subheading'

  mixins: [blockMixin]
}

SingleImage = {
  template: '#template-single-image'

  mixins: [blockMixin]

  methods: {
    updateImage: (event) ->
      file = event.target.files[0]

      thus = this
      reader = new FileReader()
      reader.onloadend = (e) ->
        thus.block.image = e.target.result if e.target.readyState == FileReader.DONE
      reader.readAsDataURL(file)

      this.$emit('bb8-update-block', this.block)
  }
}

BB8 = {
  template: '#template-bb8'

  data: -> {
    blocks: []
    ids: []
    output: ''
  }

  props: ['initialJson']

  components: {
    'controls': Controls
    'heading': Heading
    'subheading': Subheading
    'single-image': SingleImage
  }

  computed: {
    # output: ->
      # JSON.stringify(this.blocks)
    ids: ->
      _.map(this.blocks, 'id').sort()
  }

  created: ->
    this.blocks = JSON.parse(this.initialJson)

    eventHub.$on('bb8-add-block', this.addBlock)
    eventHub.$on('bb8-form-submitted', this.compileBlocks)

  methods: {
    addBlock: (newBlock) ->
      switch newBlock.blocktype
        when 'heading', 'subheading'
          fields = {
            text: ''
          }
          # [{
          #   text: ''
          #   required: true
          # }]
        when 'single-image'
          fields = {
            image: ''
            text: ''
          }

      this.blocks.splice(newBlock.index + 1, 0, _.merge({
        blocktype: newBlock.blocktype,
        id: if this.ids.length then _.last(this.ids) + 1 else 1
      }, fields))

    compileBlocks: ->
      # Validations
      this.output = JSON.stringify(this.blocks)
  }
}

vm = new Vue({
  el: '#bb8-form'

  components: {
    'bb8': BB8
  }

  methods: {
    submit: (event) ->
      event.preventDefault()
      eventHub.$emit('bb8-form-submitted')
  }
})
