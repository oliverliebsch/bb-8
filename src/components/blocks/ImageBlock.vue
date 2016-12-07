<template>
  <div class="bb8-block">
    <input name="file" accept="image/*" required type="file" :id="'bb8-file-' + index" class="bb8-block-image-fileinput" @change="updateImage($event)">
    <div class="bb8-block-image-label-wrapper" v-show="block.fields[1].content == ''">
      <label :for="'bb8-file-' + index" class="bb8-block-image-label" >
        <svg class="icon icon-upload"><use xlink:href="#icon-upload"></use></svg>
      </label>
      <a class="bb8-block-image-remove" @click="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <div class="bb8-block-image-wrapper" v-if="block.fields[1].content != ''">
      <div :class="['bb8-block-image-preview-wrapper', fields[2].content]">
        <img :src="block.fields[1].content" class="bb8-block-image-preview">
      </div>
      <div :class="['bb8-block-image-alignment', fields[2].content]">
        <svg class="icon icon-image-left" @click="setAlignment('left')"><use xlink:href="#icon-image-left"></use></svg>
        <svg class="icon icon-image-center" @click="setAlignment('center')"><use xlink:href="#icon-image-center"></use></svg>
        <svg class="icon icon-image-right" @click="setAlignment('right')"><use xlink:href="#icon-image-right"></use></svg>
      </div>
      <a class="bb8-block-image-remove" @click="removeImage()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <input :value="block.fields[0].content" @blur="updateAltText($event)" class="bb8-form-control bb8-block-image-alt" placeholder="Image caption" required>
    <controls :index="index" :block-types="blockTypes"></controls>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'single-image'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }, {
      type: 'image'
      content: ''
    }, {
      type: 'alignment'
      content: 'center'
    }]
  }

  mounted: ->
    # TODO: brrr…
    this.$el.getElementsByTagName('label')[0].click() if this.block.fields[1].content.length <= 0

  methods: {
    updateAltText: (event) ->
      this.block.fields[0].content = event.target.value

    updateImage: (event) ->
      file = event.target.files[0]

      that = this
      reader = new FileReader()
      reader.onloadend = (e) ->
        that.block.fields[1].content = e.target.result if e.target.readyState == FileReader.DONE
      reader.readAsDataURL(file)

    setAlignment: (alignment) ->
      this.fields[2].content = alignment

    removeImage: ->
      this.block.fields[1].content = ''
      # TODO: ugly
      document.getElementById('bb8-file-' + this.index).value = ''

    removeBlock: ->
      eventBus.$emit('bb8-remove-block', this.index)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-image-fileinput
  overflow: hidden
  position: absolute
  z-index: -1
  width: 0.1px
  height: 0.1px
  opacity: 0
  &:focus
    .bb8-block-image-label
      border-color: black
      color: black

.bb8-block-image-label-wrapper
  position: relative
  margin: 0 0.25em 0.5em
  .bb8-block-image-remove
    top: -12px
    right: -12px

.bb8-block-image-label
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

.bb8-block-image-wrapper
  position: relative
  margin: 0 0.25em 0.5em
  &:hover
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
  background: rgba(0, 0, 0, 0.5)
  font-size: 1.6em
  text-align: center
  line-height: 1
  color: white
  transition: opacity 0.2s ease-in
  .icon
    vertical-align: middle
    transition: all 0.2s ease-in
    cursor: pointer
    &:hover
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

.bb8-block-image-remove
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

.bb8-block-image-alt
  appearance: none
  text-align: center
  font-style: italic
</style>
