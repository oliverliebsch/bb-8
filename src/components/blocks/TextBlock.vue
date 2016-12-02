<template>
  <div class="bb8-block">
    <div contenteditable="true" @input="updateText($event)" v-html="block.fields[0].content" class="bb8-form-control bb8-block-text" required></div>
    <controls :index="index"></controls>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'text'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'html'
      content: ''
    }]
  }

  methods: {
    updateText: (event) ->
      this.block.fields[0].content = event.target.innerHTML
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-text
  overflow: auto
  -webkit-overflow-scrolling: touch
  height: auto
  div, span, h1, h2, h3, h4, h5, h6, p, blockquote, a, em, img, small, strike, strong, sub, sup, b, u, i, ol, ul, li
    vertical-align: baseline
    margin: 0
    padding: 0
    border: 0
    font-size: 100%
    font: inherit
  blockquote, q
    quotes: none
    &::before,
    &::after
      content: none
  img
    border: 0
  ol, ul
    list-style: none
</style>
