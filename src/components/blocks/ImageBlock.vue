<template>
  <div class="bb8-block">
    <input name="file" required type="file" :id="'bb8-file-' + index" class="bb8-block-image-fileinput" @change="updateImage($event)">
    <div class="bb8-block-image-label-wrapper" v-show="block.fields[1].content == ''">
      <label :for="'bb8-file-' + index" class="bb8-block-image-label" >
        <svg class="icon icon-upload"><use xlink:href="#icon-upload"></use></svg>
      </label>
      <a class="bb8-block-image-remove" @click="removeBlock()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <div class="bb8-block-image-wrapper">
      <img :src="block.fields[1].content" class="bb8-block-image-preview">
      <a class="bb8-block-image-remove" v-show="block.fields[1].content != ''" @click="removeImage()">
        <svg class="icon icon-remove"><use xlink:href="#icon-remove"></use></svg>
      </a>
    </div>
    <input :value="block.fields[0].content" @blur="updateAltText($event)" class="bb8-form-control bb8-block-image-alt" placeholder="Describe the image" required>
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
    }]
  }

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

.bb8-block-image-preview
  display: block
  width: auto
  max-width: 100%

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
