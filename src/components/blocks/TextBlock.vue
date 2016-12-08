<template>
  <div class="bb8-block">
    <div @blur="updateText($event)" @keyup.delete="removeBlock($event)" v-html="content" class="bb8-form-control bb8-block-text" required></div>
    <controls :index="index" :block-types="blockTypes"></controls>
  </div>
</template>

<script lang="coffee">
MediumEditor = require('medium-editor')
require('medium-editor/dist/css/medium-editor.css')

import eventBus from './../../EventBus.vue'
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'text'

  mixins: [blockMixin]

  data: -> {
    content: ''
    fields: {
      content: ''
    }
  }

  created: ->
    this.content = this.block.fields.content

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

    this.$el.firstChild.focus() if this.block.fields.content.length <= 0

    # that = this
    # editor.subscribe('editableInput', (event, editable) ->
    #   that.block.fields.content = event.target.innerHTML
    # )

  methods: {
    updateText: (event) ->
      this.block.fields.content = event.target.innerHTML

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

// Medium
.medium-toolbar-arrow-under:after
  top: 40px
  border-color: #000 transparent transparent transparent

.medium-toolbar-arrow-over:before
  border-color: transparent transparent #000 transparent

.medium-editor-toolbar
  border: none
  border-radius: 3px
  background-color: #000
  li
    button
      height: 40px
      padding: 11px 15px !important
      border: none
      background-color: transparent
      color: #ccc
      transition: background-color .2s ease-in, color .2s ease-in
      &:hover,
      &.medium-editor-button-active
        background-color: #000
        text-decoration: underline
        color: white

.medium-editor-button-first
  border-bottom-left-radius: 3px
  border-top-left-radius: 3px

.medium-editor-button-last
  border-bottom-right-radius: 3px
  border-right: none
  border-top-right-radius: 3px

.medium-editor-toolbar-form
  overflow: hidden
  border-radius: 3px
  background: #000
  color: #ccc
  .medium-editor-toolbar-input
    box-sizing: border-box
    width: 220px
    height: 40px
    padding-left: 16px
    background: #000
    color: #ccc
    &::placeholder
      color: #f8f5f3
      color: rgba(248, 245, 243, 0.8)
  a
    color: #ccc
    transform: translateY(2px)
  .medium-editor-toolbar-close
    margin-right: 16px

.medium-editor-toolbar-anchor-preview
  padding: 5px 12px
  border-radius: 3px
  background: #000

.medium-editor-anchor-preview a
  color: #ccc
  text-decoration: none
</style>
