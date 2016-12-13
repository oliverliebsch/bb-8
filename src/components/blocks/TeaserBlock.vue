<template>
  <div class="bb8-block">
    <input v-model="block.fields.title" class="bb8-form-control bb8-block-teaser-title" placeholder="Title" required>
    <div class="bb8-block-teaser-content">
      <div class="bb8-block-teaser-left">
        <input name="image[file]" type="file" accept="image/*" :id="'bb8-file-' + index" class="bb8-block-teaser-image-fileinput" @change="updateImage($event)">

        <div class="bb8-block-teaser-image-label-wrapper" v-show="block.fields.image == ''">
          <label :for="'bb8-file-' + index" class="bb8-block-teaser-image-label" >
            <svg class="icon icon-upload"><use xlink:href="#icon-upload"></use></svg>
          </label>
        </div>

        <div class="bb8-block-teaser-image-wrapper" v-if="block.fields.image != ''">
          <div :class="['bb8-block-teaser-image-preview-wrapper', fields.alignment]">
            <img :src="block.fields.image" class="bb8-block-image-preview">
          </div>
          <a class="bb8-block-teaser-image-remove" @click="removeImage()">
            <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
          </a>
        </div>
      </div>

      <div class="bb8-block-teaser-right">
        <textarea v-model="block.fields.text" class="bb8-form-control bb8-block-teaser-text" rows="4" placeholder="Type your text" required></textarea>
        <input v-model="block.fields.link" class="bb8-form-control" placeholder="http://…">
      </div>
    </div>
    <controls :index="index" :block-types="blockTypes"></controls>
  </div>
</template>

<script lang="coffee">
import eventBus from './../../EventBus.vue'
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'teaser'

  mixins: [blockMixin]

  data: -> {
    fields: {
      title: ''
      text: ''
      image: ''
      link: ''
    }
  }

  methods: {
    removeBlock: (event, checkUrl = false) ->
      return if checkUrl && event.target.value.length >= 0
      eventBus.$emit('bb8-remove-block', this.index)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-teaser-title
  margin-bottom: 0.5em

.bb8-block-teaser-content
  padding: 0 0.25em
  &::after
    display: block
    content: ""
    clear: both

.bb8-block-teaser-left
  float: left
  width: 32%

.bb8-block-teaser-image-fileinput
  overflow: hidden
  position: absolute
  z-index: -1
  opacity: 0
  &:focus
    .bb8-block-teaser-image-label
      border-color: black
      color: black

.bb8-block-teaser-image-label-wrapper
  position: relative
  margin: 0 0.25em 0.5em
  .bb8-block-teaser-image-remove
    top: -12px
    right: -12px

.bb8-block-teaser-image-label
  display: block
  padding: 0.5em 0.5em 0.2em
  border: 2px dashed lightgray
  border-radius: 8px
  text-align: center
  line-height: 1
  color: lightgray
  cursor: pointer
  transition: all 0.2s ease-in
  &:hover
    border-color: black
    color: black
  .icon
    font-size: 1.4em

.bb8-block-teaser-image-remove
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

.bb8-block-teaser-right
  float: right
  width: 65%

.bb8-block-teaser-text
  margin-bottom: 0.5em
  resize: vertical
</style>
