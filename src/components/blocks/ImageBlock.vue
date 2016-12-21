<template>
  <div class="bb8-block">
    <input tabindex="-1" name="image[file]" type="file" accept="image/*" :required="block.fields.image == ''" :id="'bb8-file-' + index" class="bb8-block-image-fileinput" @change="updateImage($event)">

    <div class="bb8-block-image-wrapper" v-if="block.fields.image != ''">
      <div :class="['bb8-block-image-preview-wrapper', fields.alignment]">
        <img :src="block.fields.image" class="bb8-block-image-preview">
      </div>
      <div :class="['bb8-block-image-alignment', fields.alignment]" v-if="!disallowAllignment">
        <svg role="button" tabindex="0" class="icon icon-image-left" @click="setAlignment('left')" @keypress.enter="setAlignment('left')"><use xlink:href="#icon-image-left"></use></svg>
        <svg role="button" tabindex="0" class="icon icon-image-center" @click="setAlignment('center')" @keypress.enter="setAlignment('center')"><use xlink:href="#icon-image-center"></use></svg>
        <svg role="button" tabindex="0" class="icon icon-image-right" @click="setAlignment('right')" @keypress.enter="setAlignment('right')"><use xlink:href="#icon-image-right"></use></svg>
      </div>
      <a role="button" tabindex="0" class="bb8-block-remove" @click="removeBlock()" @keypress.enter="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>

    <input v-model="block.fields.alt" class="bb8-form-control bb8-block-image-alt" placeholder="Image caption" required>
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'
import uploadMixin from './../UploadMixin.vue'

export default {
  name: 'single-image'

  mixins: [blockMixin, uploadMixin]

  props: ['disallowAllignment']

  data: -> {
    fields: {
      alt: ''
      image: ''
      image_id: ''
      alignment: 'center'
    }
  }

  mounted: ->
    vm = this

    # TODO: brrr…
    this.$el.querySelector('.bb8-block-image-fileinput').click() if this.block.fields.image.length <= 0

    # TODO: Is there a better solution to handle cancelling a file input dialog?
    window.addEventListener('focus', (event) ->
      setTimeout(->
        vm.onFileInputCancel()
      , 100)
    )

  methods: {
    onFileInputCancel: ->
      this.removeBlock() if this.block.fields.image.length <= 0 && this.$el.querySelector('.bb8-block-image-fileinput').files.length <= 0

    updateImage: (event) ->
      this.uploadImage(event)

    setAlignment: (alignment) ->
      this.fields.alignment = alignment

    removeBlock: ->
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass'>
.bb8-block-image-fileinput
  overflow: hidden
  position: absolute
  z-index: -1
  opacity: 0

.bb8-block-image-wrapper
  position: relative
  margin: 0 0 0.5em
  &:hover,
  &:focus
    .bb8-block-image-alignment
      opacity: 1

.bb8-block-image-preview-wrapper
  transition: padding 0.2s ease-in
  &.left
    padding-right: 50%
  &.right
    padding-left: 50%

.bb8-block-image-preview
  display: block
  width: auto
  max-width: 100%

.bb8-block-image-alignment
  position: absolute
  right: 0
  top: 0
  left: 0
  padding: 0.5em 0 0.25em
  opacity: 0
  outline: none
  background: rgba(0, 0, 0, 0.5)
  font-size: 1.6em
  text-align: center
  line-height: 1
  color: white
  transition: opacity 0.2s ease-in
  .icon
    vertical-align: middle
    outline: none
    transition: all 0.2s ease-in
    cursor: pointer
    &:hover,
    &:focus
      font-size: 1.6em
  &.center
    .icon-image-center
      font-size: 1.6em
  &.left
    .icon-image-left
      font-size: 1.6em
  &.right
    .icon-image-right
      font-size: 1.6em

.bb8-block-image-alt
  appearance: none
  text-align: center
  font-style: italic
</style>
