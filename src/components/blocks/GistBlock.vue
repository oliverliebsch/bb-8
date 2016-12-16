<template>
  <div class="bb8-block">
    <input :value="block.fields.url" @keydown.prevent.enter="loadGist($event)" @keydown.delete="removeBlock($event, true)" class="bb8-form-control" placeholder="Paste a GitHub Gist url and press enter" v-show="block.fields.url == ''" required>
    <div class="bb8-block-gist-preview-wrapper" v-show="block.fields.url != ''">
      <div class="bb8-block-gist-preview"></div>
      <a role="button" tabindex="0" class="bb8-block-gist-remove" @click="removeBlock()" @keypress.enter="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'yourblockname'

  mixins: [blockMixin]

  data: -> {
    fields: {
      url: ''
    }
  }

  mounted: ->
    this.$el.firstChild.focus() if this.block.fields.url.length <= 0

  methods: {
    test: ->
      debugger

    loadGist: (event) ->
      url = event.target.value
      this.block.fields.url = url

      gistFrame = document.createElement('iframe')
      gistFrame.className = 'bb8-block-gist-iframe'

      previewContainer = this.$el.querySelector('.bb8-block-gist-preview')
      previewContainer.innerHTML = ''
      previewContainer.appendChild(gistFrame)

      gistFrameHTML = '<html><body style="margin:0;"><script src="' + url + '.js"></sc'+'ript></body></html>'
      gistFrameDoc = gistFrame.document

      if gistFrame.contentDocument
        gistFrameDoc = gistFrame.contentDocument
      else if gistFrame.contentWindow
        gistFrameDoc = gistFrame.contentWindow.document

      gistFrameDoc.open()
      gistFrameDoc.writeln(gistFrameHTML)
      gistFrameDoc.close()

    removeBlock: (event) ->
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-gist-preview-wrapper
  position: relative

.bb8-block-gist-iframe
  width: 100%
  height: 240px
  border: none

.bb8-block-gist-remove
  display: table
  position: absolute
  top: -12px
  right: -12px
  width: 24px
  height: 24px
  padding: 2px
  border-radius: 50%
  outline: none
  background-color: black
  line-height: 1
  color: white
  cursor: pointer
  transition: transform 0.2s ease-in
  &:hover,
  &:focus
    transform: rotate(90deg)
  .icon
    display: table-cell
    width: 100%
    height: 100%
</style>
