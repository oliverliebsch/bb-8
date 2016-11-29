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


# central event bus
eventBus = new Vue()

Controls = {
  template: '#template-controls'

  props: ['index']

  methods: {
    addBlock: (type) ->
      eventBus.$emit('bb8-add-block', { blocktype: type, index: this.index })
  }
}

blockMixin = {
  data: -> {
    block: this.initialData
  }

  props: ['initialData', 'index']

  components: {
    'controls': Controls
  }

  created: ->
    _.defaults(this.initialData, {fields: this.fields})

    eventBus.$on('bb8-form-submitted', this.validate)

  methods: {
    updateText: (text) ->
      this.block.fields[0].content = text
      # this.$emit('bb8-update-block', this.block)
    validate: ->
      console.log "validate"
  }
}

Heading = {
  template: '#template-heading'

  data: -> {
    fields: [{
      type: 'text'
      content: ''
      required: true
    }]
    # heading: ''
  }

  mixins: [blockMixin]

  # watch: {
  #  v-model='heading'
  #   heading: (test) ->
  #     console.log "test"
  # }

  # created: ->
    # this.heading = this.block.fields[0].content
    # eventBus.$on('bb8-validate-block-heading', this.validate)
}

Subheading = {
  template: '#template-subheading'

  data: -> {
    fields: [{
      text: ''
      required: true
    }]
  }

  mixins: [blockMixin]
}

SingleImage = {
  template: '#template-single-image'

  data: -> {
    fields: [{
      type: 'text'
      content: ''
      required: true
    }, {
      type: 'image'
      content: ''
      required: true
    }]
  }

  mixins: [blockMixin]

  methods: {
    updateImage: (event) ->
      file = event.target.files[0]

      that = this
      reader = new FileReader()
      reader.onloadend = (e) ->
        that.block.fields[1].content = e.target.result if e.target.readyState == FileReader.DONE
      reader.readAsDataURL(file)

      # this.$emit('bb8-update-block', this.block)
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
    this.compileBlocks()

    eventBus.$on('bb8-add-block', this.addBlock)
    eventBus.$on('bb8-form-submitted', this.compileBlocks)

  methods: {
    addBlock: (newBlock) ->
      this.blocks.splice(newBlock.index + 1, 0, {
        blocktype: newBlock.blocktype,
        id: if this.ids.length then _.last(this.ids) + 1 else 1
      })

    compileBlocks: ->
      # Validations
      # Better? Validation on the component instance? Directive?
      for block in this.blocks
        for field in block.fields
          if field.required && field.content == ''
            console.log "error"
            # eventBus.$emit('bb8-validate-block-' + block.blocktype)
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
      # IDEA
      # attr valid: t/f for each block
      # watcher on blocks and this attr
      # each block changes this attr after submission
      # default is false for a new block
      # reset on change
      eventBus.$emit('bb8-form-submitted')
  }
})
