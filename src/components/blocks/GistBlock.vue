<template>
  <div class="bb8-block">
    <input :value="block.fields.url" @keydown.prevent.enter="loadGist($event)" @keydown.delete="removeBlock($event, true)" class="bb8-form-control" placeholder="Paste a GitHub Gist url and press enter" v-show="block.fields.url == ''" required>
    <div class="bb8-block-gist-preview-wrapper" v-show="block.fields.url != ''">
      <div class="bb8-block-gist-preview"></div>
      <a role="button" tabindex="0" class="bb8-block-remove" @click="removeBlock()" @keypress.enter="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'gist'

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

      gistFrameHTML = '<html><head><base target="_parent"></head><body style="margin:0;"><script src="' + url + '.js"></sc'+'ript></body></html>'
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

<style lang='sass'>
.bb8-block-gist-preview-wrapper
  position: relative

.bb8-block-gist-iframe
  width: 100%
  height: 240px
  border: none
</style>
