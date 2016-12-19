<template>
  <div class="bb8-block">
    <ul class="bb8-block-gallery">
      <li class="bb8-block-gallery-item" v-for="(block, index) in fields.blocks">
        <image-block :index="index" :block="block" :config="config" :disallow-allignment="true" v-on:remove-block="removeImage"></image-block>
      </li>
      <li class="bb8-block-gallery-item">
        <a role="button" tabindex="0" @click="addImage()" @keypress.enter="addImage()" class="bb8-block-gallery-add-image">
          <svg class="icon icon-add-block"><use xlink:href="#icon-add-block"></use></svg>
        </a>
      </li>
    </ul>
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'
import ImageBlock from './ImageBlock.vue'

export default {
  name: 'gallery'

  mixins: [blockMixin]

  props: ['config']

  components: {
    ImageBlock
  }

  data: -> {
    fields: {
      blocks: []
    }
  }

  created: ->
    this.fields.blocks = [{
      blocktype: 'image'
      fields: {}
    }]

  methods: {
    addImage: ->
      this.fields.blocks.push({
        blocktype: 'image'
        fields: {}
      })

    removeImage: (index) ->
      this.fields.blocks.splice(index, 1)

      return if this.fields.blocks.length > 0
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass'>
.bb8-block-gallery
  margin: 0
  padding: 0
  list-style-type: none
  .bb8-block
    padding-left: 0
  &::after
    display: block
    content: ""
    clear: both

.bb8-block-gallery-item
  float: left
  width: 25%
  padding: 0 1em 1em 0
  &:nth-child(4n+1)
    clear: left
  .bb8-block-image-wrapper
    margin: 0

.bb8-block-gallery-add-image
  display: block
  padding: 0.5em 0.5em 0.2em
  border: 2px dashed lightgray
  outline: none
  border-radius: 8px
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
</style>
