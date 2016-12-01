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

  methods: {
    updateText: (text) ->
      this.block.fields[0].content = text
  }
}

Heading = {
  template: '#template-heading'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }]
  }
}

Subheading = {
  template: '#template-subheading'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }]
  }
}

SingleImage = {
  template: '#template-single-image'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }, {
      type: 'image'
      content: ''
    }]
  }

  methods: {
    updateImage: (event) ->
      file = event.target.files[0]

      that = this
      reader = new FileReader()
      reader.onloadend = (e) ->
        that.block.fields[1].content = e.target.result if e.target.readyState == FileReader.DONE
      reader.readAsDataURL(file)
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
    ids: ->
      _.map(this.blocks, 'id').sort()
  }

  created: ->
    blocks = JSON.parse(this.initialJson)

    # The blocks list relies on its child component states
    # so we have to track the list by a unique id instead of the index
    # see `:key='block.id'` in the template
    block.id = blocks.indexOf(block) + 1 for block in blocks

    this.blocks = blocks

    this.compileBlocks()

    eventBus.$on('bb8-add-block', this.addBlock)
    eventBus.$on('bb8-form-submitted', this.compileBlocks)

  methods: {
    createBlockId: ->
      if this.ids.length then _.last(this.ids) + 1 else 1

    addBlock: (newBlock) ->
      this.blocks.splice(newBlock.index + 1, 0, {
        blocktype: newBlock.blocktype,
        id: this.createBlockId()
      })

    compileBlocks: ->
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
      eventBus.$emit('bb8-form-submitted')
  }
})
