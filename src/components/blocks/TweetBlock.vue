<template>
  <div class="bb8-block">
    <input :value="block.fields.id" @keydown.prevent.enter="loadTweet($event)" @keydown.delete="removeBlock($event, true)" class="bb8-form-control" placeholder="Paste a tweet ID and press enter" v-show="block.fields.id == ''" required>
    <div class="bb8-block-tweet-wrapper">
      <div class="bb8-block-tweet"></div>
      <a class="bb8-block-video-remove" @click="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'tweet'

  mixins: [blockMixin]

  data: -> {
    fields: {
      id: ''
    }
  }

  mounted: ->
    this.$el.firstChild.focus() if this.block.fields.id.length <= 0

  methods: {
    loadTweet: (event) ->
      vm = this
      id = event.target.value
      this.block.fields.id = id

      window.twttr = this.loadTwitterWidgetJS(->
        window.twttr.widgets.createTweet(
          id,
          vm.$el.querySelector('.bb8-block-tweet'),
          {}
        )
      )

    loadTwitterWidgetJS: (callback) ->
      js = fjs = document.getElementsByTagName('script')[0]
      t = window.twttr || {}

      if document.getElementById('twitter-wjs')
        callback()
        return t

      js = document.createElement('script')
      js.onreadystatechange = ->
        if js.readyState == 'loaded' || js.readyState == 'complete'
          js.onreadystatechange = null
          callback()
      js.onload = -> callback()
      js.id = 'twitter-wjs'
      js.src = '//platform.twitter.com/widgets.js'
      fjs.parentNode.insertBefore(js, fjs)

      t._e = []
      t.ready = (f) -> t._e.push(f)

      return t

    removeBlock: (event) ->
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-tweet-wrapper
  position: relative

.bb8-block-video-remove
  display: table
  position: absolute
  top: -12px
  right: -12px
  width: 24px
  height: 24px
  padding: 2px
  border-radius: 50%
  background-color: black
  line-height: 1
  color: white
  cursor: pointer
  transition: transform 0.2s ease-in
  &:hover
    transform: rotate(90deg)
  .icon
    display: table-cell
    width: 100%
    height: 100%
</style>
