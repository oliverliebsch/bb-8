<template>
  <div class="bb8">
    <svg style="position: absolute; width: 0; height: 0; overflow: hidden;" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <defs>
        <symbol id="icon-heading-block" viewBox="0 0 32 32">
          <title>heading-block</title>
          <path class="path1" d="M15.983 7.828h-3.315v7.136h-6.766v-7.136h-3.326v16.592h3.326v-6.896h6.766v6.896h3.315v-16.592zM29.414 21.86h-6.971l-0.023-0.057 2.95-3.219q1.902-2.062 2.728-3.333t0.826-2.775q0-2.222-1.464-3.555t-4.027-1.333q-2.597 0-4.129 1.553t-1.475 3.797l0.023 0.068h3.235q0-1.298 0.598-2.079t1.748-0.78q1.037 0 1.6 0.667t0.564 1.716q0 0.787-0.49 1.705t-1.652 2.252l-5.365 5.755v2.177h11.322v-2.56z"></path>
        </symbol>
        <symbol id="icon-subheading-block" viewBox="0 0 32 32">
          <title>subheading-block</title>
          <path class="path1" d="M15.983 7.828h-3.315v7.136h-6.766v-7.136h-3.326v16.592h3.326v-6.896h6.766v6.896h3.315v-16.592zM21.452 17.204h1.868q1.276 0 1.931 0.609t0.655 1.918q0 1.093-0.667 1.731t-1.817 0.638q-1.048 0-1.732-0.618t-0.683-1.572h-3.224l-0.023 0.068q-0.057 2.233 1.6 3.457t3.969 1.224q2.586 0 4.243-1.305t1.657-3.585q0-1.345-0.724-2.36t-2.101-1.505q1.196-0.547 1.88-1.521t0.684-2.056q0-2.278-1.532-3.509t-4.107-1.231q-2.312 0-3.873 1.265t-1.492 3.212l0.023 0.068h3.223q0-0.889 0.638-1.437t1.572-0.547q1.082 0 1.652 0.604t0.57 1.607q0 1.106-0.57 1.727t-1.754 0.621h-1.868v2.496z"></path>
        </symbol>
        <symbol id="icon-text-block" viewBox="0 0 24 24">
          <title>text-block</title>
          <path class="path1" d="M14 17h-10v2h10v-2zM20 9h-16v2h16v-2zM4 15h16v-2h-16v2zM4 5v2h16v-2h-16z"></path>
        </symbol>
        <symbol id="icon-add-block" viewBox="0 0 24 24">
          <title>add-block</title>
          <path class="path1" d="M13 7h-2v4h-4v2h4v4h2v-4h4v-2h-4v-4zM12 2c-5.525 0-10 4.475-10 10s4.475 10 10 10 10-4.475 10-10-4.475-10-10-10zM12 20c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"></path>
        </symbol>
        <symbol id="icon-image-block" viewBox="0 0 24 24">
          <title>image-block</title>
          <path class="path1" d="M15.2 12c0 1.767-1.433 3.2-3.2 3.2s-3.2-1.433-3.2-3.2c0-1.767 1.433-3.2 3.2-3.2s3.2 1.433 3.2 3.2z"></path>
          <path class="path2" d="M9 2l-1.83 2h-3.17c-1.105 0-2 0.895-2 2v12c0 1.105 0.895 2 2 2h16c1.105 0 2-0.895 2-2v-12c0-1.105-0.895-2-2-2h-3.17l-1.83-2h-6zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"></path>
        </symbol>
        <symbol id="icon-image-right" viewBox="0 0 32 32">
          <title>image-right</title>
          <path class="path1" d="M3.34 4.010h25.31v3.98h-25.31v-3.98zM28.65 24.040h-25.31v3.98h25.31v-3.98zM28.65 9.97h-11.61v12.070h11.61v-12.070zM14.96 9.973h-11.61v2.634h11.61v-2.634zM14.95 19.408h-11.61v2.634h11.61v-2.635zM14.96 14.791h-11.61v2.634h11.61v-2.634z"></path>
        </symbol>
        <symbol id="icon-image-center" viewBox="0 0 32 32">
          <title>image-center</title>
          <path class="path1" d="M3.34 4.010h25.31v3.98h-25.31v-3.98zM3.34 24.040h25.31v3.98h-25.31v-3.98zM3.34 9.97h25.31v12.070h-25.31v-12.070z"></path>
        </symbol>
        <symbol id="icon-image-left" viewBox="0 0 32 32">
          <title>image-left</title>
          <path class="path1" d="M3.34 4.010h25.31v3.98h-25.31v-3.98zM3.34 24.040h25.31v3.98h-25.31v-3.98zM3.34 9.97h11.61v12.070h-11.61v-12.070zM17.030 9.973h11.61v2.634h-11.61v-2.634zM17.040 19.408h11.61v2.634h-11.61v-2.635zM17.030 14.791h11.61v2.634h-11.61v-2.634z"></path>
        </symbol>
        <symbol id="icon-video-block" viewBox="0 0 24 24">
          <title>video-block</title>
          <path class="path1" d="M12 20.016c4.406 0 8.016-3.609 8.016-8.016s-3.609-8.016-8.016-8.016-8.016 3.609-8.016 8.016 3.609 8.016 8.016 8.016zM12 2.016c5.531 0 9.984 4.453 9.984 9.984s-4.453 9.984-9.984 9.984-9.984-4.453-9.984-9.984 4.453-9.984 9.984-9.984zM9.984 16.5v-9l6 4.5z"></path>
        </symbol>
        <symbol id="icon-gallery-block" viewBox="0 0 32 32">
          <title>gallery-block</title>
          <path class="path1" d="M3.351 4.039v10.386h11.608v-10.386h-11.608zM4.235 13.42l2.426-3.121 1.791 2.111 2.507-3.151 3.122 4.161zM17.041 4.039v10.386h11.608v-10.386h-11.608zM17.925 13.42l2.426-3.121 1.791 2.111 2.507-3.151 3.122 4.161zM3.351 16.493v10.387h11.608v-10.387h-11.608zM4.235 25.81l2.426-3.121 1.791 2.111 2.507-3.151 3.122 4.161zM17.041 16.493v10.387h11.608v-10.387h-11.608zM17.925 25.81l2.426-3.121 1.791 2.111 2.507-3.151 3.122 4.161z"></path>
        </symbol>
        <symbol id="icon-teaser-block" viewBox="0 0 32 32">
          <title>teaser-block</title>
          <path class="path1" d="M17.041 10.011v2.639h11.608v-2.639h-11.608zM17.041 14.72v2.639h11.608v-2.639h-11.608zM3.35 4.040v4.009h25.299v-4.009h-25.299zM3.351 10.010v12.059h11.608v-12.059h-11.608zM4.235 21l2.426-3.121 1.791 2.111 2.507-3.151 3.122 4.161zM3.35 24.14h25.299v2.639h-25.299v-2.639zM17.041 19.43h11.608v2.639h-11.608v-2.639z"></path>
        </symbol>
        <symbol id="icon-gist-block" viewBox="0 0 24 28">
          <title>gist-block</title>
          <path class="path1" d="M12 2c6.625 0 12 5.375 12 12 0 5.297-3.437 9.797-8.203 11.391-0.609 0.109-0.828-0.266-0.828-0.578 0-0.391 0.016-1.687 0.016-3.297 0-1.125-0.375-1.844-0.812-2.219 2.672-0.297 5.484-1.313 5.484-5.922 0-1.313-0.469-2.375-1.234-3.219 0.125-0.313 0.531-1.531-0.125-3.187-1-0.313-3.297 1.234-3.297 1.234-0.953-0.266-1.984-0.406-3-0.406s-2.047 0.141-3 0.406c0 0-2.297-1.547-3.297-1.234-0.656 1.656-0.25 2.875-0.125 3.187-0.766 0.844-1.234 1.906-1.234 3.219 0 4.594 2.797 5.625 5.469 5.922-0.344 0.313-0.656 0.844-0.766 1.609-0.688 0.313-2.438 0.844-3.484-1-0.656-1.141-1.844-1.234-1.844-1.234-1.172-0.016-0.078 0.734-0.078 0.734 0.781 0.359 1.328 1.75 1.328 1.75 0.703 2.141 4.047 1.422 4.047 1.422 0 1 0.016 1.937 0.016 2.234 0 0.313-0.219 0.688-0.828 0.578-4.766-1.594-8.203-6.094-8.203-11.391 0-6.625 5.375-12 12-12zM4.547 19.234c0.031-0.063-0.016-0.141-0.109-0.187-0.094-0.031-0.172-0.016-0.203 0.031-0.031 0.063 0.016 0.141 0.109 0.187 0.078 0.047 0.172 0.031 0.203-0.031zM5.031 19.766c0.063-0.047 0.047-0.156-0.031-0.25-0.078-0.078-0.187-0.109-0.25-0.047-0.063 0.047-0.047 0.156 0.031 0.25 0.078 0.078 0.187 0.109 0.25 0.047zM5.5 20.469c0.078-0.063 0.078-0.187 0-0.297-0.063-0.109-0.187-0.156-0.266-0.094-0.078 0.047-0.078 0.172 0 0.281s0.203 0.156 0.266 0.109zM6.156 21.125c0.063-0.063 0.031-0.203-0.063-0.297-0.109-0.109-0.25-0.125-0.313-0.047-0.078 0.063-0.047 0.203 0.063 0.297 0.109 0.109 0.25 0.125 0.313 0.047zM7.047 21.516c0.031-0.094-0.063-0.203-0.203-0.25-0.125-0.031-0.266 0.016-0.297 0.109s0.063 0.203 0.203 0.234c0.125 0.047 0.266 0 0.297-0.094zM8.031 21.594c0-0.109-0.125-0.187-0.266-0.172-0.141 0-0.25 0.078-0.25 0.172 0 0.109 0.109 0.187 0.266 0.172 0.141 0 0.25-0.078 0.25-0.172zM8.937 21.438c-0.016-0.094-0.141-0.156-0.281-0.141-0.141 0.031-0.234 0.125-0.219 0.234 0.016 0.094 0.141 0.156 0.281 0.125s0.234-0.125 0.219-0.219z"></path>
        </symbol>
        <symbol id="icon-remove" viewBox="0 0 24 24">
          <title>remove</title>
          <path class="path1" d="M18.984 6.422l-5.578 5.578 5.578 5.578-1.406 1.406-5.578-5.578-5.578 5.578-1.406-1.406 5.578-5.578-5.578-5.578 1.406-1.406 5.578 5.578 5.578-5.578z"></path>
        </symbol>
        <symbol id="icon-upload" viewBox="0 0 24 24">
          <title>upload</title>
          <path class="path1" d="M5.016 18h13.969v2.016h-13.969v-2.016zM9 15.984v-6h-3.984l6.984-6.984 6.984 6.984h-3.984v6h-6z"></path>
        </symbol>
      </defs>
    </svg>
    <textarea class="bb8-output" :name="config.name" v-model="output"></textarea>
    <div class="bb8-default-controls">
      <controls :index="-1" :block-types="blockTypes" v-on:add-block="addBlock"></controls>
    </div>
    <component :index="index" :block="block" :config="config" :is="block.blocktype + '-block'" :key="block.id" v-on:remove-block="removeBlock" v-for="(block, index) in blocks">
      <controls :index="index" :block-types="blockTypes" v-on:add-block="addBlock"></controls>
    </component>
  </div>
</template>

<script lang="coffee">
import Controls from './components/Controls.vue'
import HeadingBlock from './components/blocks/HeadingBlock.vue'
import SubheadingBlock from './components/blocks/SubheadingBlock.vue'
import TextBlock from './components/blocks/TextBlock.vue'
import ImageBlock from './components/blocks/ImageBlock.vue'
import VideoBlock from './components/blocks/VideoBlock.vue'
import TeaserBlock from './components/blocks/TeaserBlock.vue'
import GalleryBlock from './components/blocks/GalleryBlock.vue'
import GistBlock from './components/blocks/GistBlock.vue'
import TweetBlock from './components/blocks/TweetBlock.vue'

export default {
  name: 'bb8'

  data: -> {
    config: {}
    blockTypes: ['heading', 'subheading', 'text', 'image', 'video', 'teaser', 'gallery', 'gist', 'tweet']
    blocks: []
    ids: []
  }

  props: ['bb8InitialData', 'bb8Config']

  components: {
    Controls
    HeadingBlock
    SubheadingBlock
    TextBlock
    ImageBlock
    VideoBlock
    TeaserBlock
    GalleryBlock
    GistBlock
    TweetBlock
  }

  computed: {
    ids: ->
      this.blocks.map((b) -> b.id).sort()
    output: ->
      JSON.stringify(this.blocks)
  }

  created: ->
    this.config = JSON.parse(this.bb8Config)[0]
    this.blockTypes = this.config.blockTypes if this.config.blockTypes.length > 0
    blocks = JSON.parse(this.bb8InitialData)

    # The blocks list relies on its child component states
    # so we have to track the list by a unique id instead of the index
    # see `:key='block.id'` in the template
    block.id = blocks.indexOf(block) + 1 for block in blocks

    this.blocks = blocks

  methods: {
    generateBlockId: ->
      idsLength = this.ids.length
      if idsLength then this.ids[idsLength - 1] + 1 else 1

    addBlock: (newBlock) ->
      this.blocks.splice(newBlock.index + 1, 0, {
        blocktype: newBlock.blocktype
        id: this.generateBlockId()
        fields: {}
      })

    removeBlock: (index) ->
      this.blocks.splice(index, 1)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.icon
  display: inline-block
  width: 1em
  height: 1em
  stroke-width: 0
  stroke: currentColor
  fill: currentColor

.bb8
  float: left
  width: 100%
  *,
  *::before,
  *::after
    box-sizing: border-box
  &::after
    display: block
    content: ""
    clear: both

.bb8-output
  display: none

.bb8-block
  position: relative
  &::after
    display: block
    content: ""
    clear: both

.bb8-form-control
  display: block
  width: 100%
  margin: 0
  padding: 0
  background-color: transparent
  font: inherit
  text-indent: 1px
  color: inherit
  &[type=text]
    appearance: none
</style>
