<template>
  <div class="bb8-block">
    <div class="bb8-block-teaser">
      <input v-model="block.fields.title" class="bb8-form-control bb8-block-teaser-title" placeholder="Title" required>
      <div class="bb8-block-teaser-content">
        <div class="bb8-block-teaser-left">
          <input tabindex="-1" name="image[file]" type="file" accept="image/*" :id="'bb8-file-' + index" class="bb8-block-teaser-image-fileinput" @change="updateImage($event)">

          <div class="bb8-block-teaser-image-label-wrapper" v-show="block.fields.image == ''">
            <label role="button" tabindex="0" :for="'bb8-file-' + index" class="bb8-block-teaser-image-label" @keypress.enter="$event.target.click()">
              <svg class="icon icon-upload"><use xlink:href="#icon-upload"></use></svg>
            </label>
          </div>

          <div class="bb8-block-teaser-image-wrapper" v-if="block.fields.image != ''">
            <div :class="['bb8-block-teaser-image-preview-wrapper', fields.alignment]">
              <img :src="block.fields.image" class="bb8-block-image-preview">
            </div>
            <a class="bb8-block-remove" @click="removeImage()">
              <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
            </a>
          </div>
        </div>

        <div class="bb8-block-teaser-right">
          <textarea v-model="block.fields.text" class="bb8-form-control bb8-block-teaser-text" rows="4" placeholder="Type your text" required></textarea>
          <input v-model="block.fields.link" class="bb8-form-control" placeholder="http://…">
        </div>
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
import uploadMixin from './../UploadMixin.vue'

export default {
  name: 'teaser'

  mixins: [blockMixin, uploadMixin]

  data: -> {
    fields: {
      title: ''
      text: ''
      image: ''
      image_id: ''
      link: ''
    }
  }

  methods: {
    updateImage: (event) ->
      this.uploadImage(event)

    removeImage: ->
      this.block.fields.image = ''
      this.block.fields.image_id = ''
      # TODO: ugly
      this.$el.querySelector('.bb8-block-teaser-image-fileinput').value = ''

    removeBlock: (event, checkUrl = false) ->
      return if checkUrl && event.target.value.length >= 0
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass'>
.bb8-block-teaser-title
  margin-bottom: 0.5em

.bb8-block-teaser-content
  &::after
    display: block
    content: ""
    clear: both

.bb8-block-teaser-left
  margin-bottom: 1em
  @media only screen and (min-width: 640px)
    float: left
    width: 32%
    margin-bottom: 0

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

.bb8-block-teaser-image-label
  display: block
  padding: 0.5em 0.5em 0.2em
  border: 2px dashed lightgray
  border-radius: 8px
  outline: none
  text-align: center
  line-height: 1
  color: lightgray
  cursor: pointer
  transition: all 0.2s ease-in
  &:hover,
  &:focus
    border-color: black
    color: black
  .icon
    font-size: 1.4em

.bb8-block-teaser-image-wrapper
  position: relative
  margin: 0 0.25em 0.5em

.bb8-block-teaser-right
  @media only screen and (min-width: 640px)
    float: right
    width: 65%

.bb8-block-teaser-text
  margin-bottom: 0.5em
  resize: vertical
</style>
