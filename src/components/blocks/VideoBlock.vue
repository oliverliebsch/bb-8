<template>
  <div class="bb8-block">
    <input :value="block.fields.url" @keydown.prevent.enter="loadVideo($event)" @keydown.delete="removeBlock($event, true)" class="bb8-form-control bb8-block-video-url" placeholder="Paste a YouTube or Vimeo video link and press enter" v-show="block.fields.id == ''" required>
    <div class="bb8-block-video-preview" v-if="block.fields.id != ''">
      <div class="bb8-block-video-wrapper">
        <iframe class="bb8-block-video-iframe" v-if="block.fields.plattform == 'youtube'" :src="'//www.youtube-nocookie.com/embed/' + block.fields.id + '?rel=0&amp;controls=0&amp;showinfo=0&amp;modestbranding=1'" frameborder="0" allowfullscreen></iframe>
        <iframe class="bb8-block-video-iframe" v-else-if="block.fields.plattform == 'vimeo'" :src="'https://player.vimeo.com/video/' + block.fields.id + '?title=0&byline=0'" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
      </div>
      <a class="bb8-block-remove" @click="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'video'

  mixins: [blockMixin]

  data: -> {
    fields: {
      plattform: ''
      url: ''
      id: ''
    }
  }

  mounted: ->
    this.$el.querySelector('.bb8-block-video-url').focus() if this.block.fields.url.length <= 0

  methods: {
    loadVideo: (event) ->
      url = event.target.value
      this.block.fields.url = url

      id = this.getVideoId(url)
      this.block.fields.id = id if id

    getVideoId: (url) ->
      rawUrl = url.replace(/^(https?:)?\/\/(www\.)?/, '')
      rawUrl = rawUrl.split('&')[0]
      rawUrl = rawUrl.split('#')[0]
      prefixes = []

      if rawUrl.startsWith('youtu')
        this.block.fields.plattform = 'youtube'
        prefixes = ['youtube.com/watch?v=', 'youtu.be/', 'youtube.com/embed/']
      else if rawUrl.startsWith('vimeo.com')
        this.block.fields.plattform = 'vimeo'
        prefixes = ['vimeo.com/']

      for prefix in prefixes
        return rawUrl.substr(prefix.length) if rawUrl.indexOf(prefix) == 0
      return undefined

    removeBlock: (event, checkUrl = false) ->
      return if checkUrl && event.target.value.length > 0
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass'>
.bb8-block-video-preview
  position: relative
  margin: 0 0 0.5em

.bb8-block-video-wrapper
  position: relative
  overflow: hidden
  width: 100%
  height: 0
  padding-bottom: 56.25%

.bb8-block-video-iframe
  position: absolute
  top: 0
  left: 0
  width: 100%
  height: 100%
</style>
