<template>
  <div class="bb8-block">
    <div @blur="updateText($event)" @keyup.delete="removeBlock($event)" v-html="tempBlock.fields[0].content" class="bb8-form-control bb8-block-text" required></div>
    <controls :index="index" :block-types="blockTypes"></controls>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'text'

  mixins: [blockMixin]

  data: -> {
    tempBlock: {}
    fields: [{
      type: 'html'
      content: ''
    }]
  }

  created: ->
    this.tempBlock = _.cloneDeep(this.block)

  mounted: ->
    editor = new MediumEditor(this.$el.querySelector('.bb8-block-text'), {
      spellcheck: false
      disableExtraSpaces: true
      toolbar: {
        allowMultiParagraphSelection: true
        buttons: ['bold', 'italic', 'anchor', 'orderedlist', 'unorderedlist']
      }
      anchor: {
        targetCheckbox: false
      }
    })

    # that = this
    # editor.subscribe('editableInput', (event, editable) ->
    #   that.block.fields[0].content = event.target.innerHTML
    # )

  methods: {
    updateText: (event) ->
      this.block.fields[0].content = event.target.innerHTML

    removeBlock: (event) ->
      return if event.target.innerHTML.length > 0
      eventBus.$emit('bb8-remove-block', this.index)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-text
  overflow: auto
  -webkit-overflow-scrolling: touch
  height: auto
  line-height: 1.6
  div, span, p, a, em, img, strike, strong, sub, sup, b, u, i, ol, ul, li
    vertical-align: baseline
    margin: 0
    padding: 0
    border: 0
    font-size: 100%
    font: inherit
  img
    border: 0
  p
    margin-bottom: 1em
    &:last-child
      margin-bottom: 0
  strong, b
    font-weight: bold
  em, i
    font-style: italic
  u
    text-decoration: underline
  ul, ol
    margin: 0 0 1.5em 1em
    &:last-child
      margin-bottom: 0
  li
    margin-bottom: 0.25em
    &:last-child
      margin-bottom: 0
  ul
    list-style-type: disc
  ol
    list-style-type: decimal
</style>
