<template>
  <div class="bb8-controls" v-if="blockTypes && blockTypes.length > 0">
    <a role="button" tabindex="0" @keyup.enter="toggleControls()" @click="toggleControls()" :class="['bb8-controls-toggle', { 'is-active': showControls }]">
      <svg class="icon icon-add-block"><use xlink:href="#icon-add-block"></use></svg>
    </a>
    <ul v-if="showControls" class="bb8-controls-block-types">
      <li class="bb8-controls-item" v-for="blockType in blockTypes">
        <a role="button" tabindex="0" @keyup.enter="addBlock(blockType)" @click="addBlock(blockType)" class="bb8-controls-action">
          <svg :class="'icon icon-' + blockType + '-block'"><use :xlink:href="'#icon-' + blockType + '-block'"></use></svg>
        </a>
      </li>
    </ul>
  </div>
</template>

<script lang="coffee">
export default {
  name: 'controls'

  data: -> {
    'showControls': false
  }

  props: ['index', 'blockTypes']

  created: ->
    window.addEventListener('mouseup', this.closeControls)

  destroyed: ->
    window.removeEventListener('mouseup', this.closeControls)

  methods: {
    isChildOf: (parent, child) ->
      node = child.parentNode
      while node != null
        return true if node == parent
        node = node.parentNode
      return false

    toggleControls: ->
      this.showControls = !this.showControls

    closeControls: (e) ->
      this.showControls = false if this.$el != e.target && !this.isChildOf(this.$el, e.target)

    addBlock: (type) ->
      this.$emit('add-block', { blocktype: type, index: this.index })
      this.showControls = false
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-controls
  position: relative
  left: -32px
  padding: 0
  font-size: 1.4em
  line-height: 1
  &::after
    display: block
    content: ""
    clear: both

.bb8-controls-toggle
  display: block
  outline: none
  opacity: 0.3
  font-weight: bold
  cursor: pointer
  &:hover, &:focus
    opacity: 1
  .icon
    float: left
    transition: transform 0.2s ease-in
  &.is-active
    float: left
    text-align: center
    .icon
      transform: rotate(45deg)

.bb8-controls-block-types
  display: block
  float: left
  margin: 0
  padding-left: 10px
  list-style-type: none
  line-height: 1

.bb8-controls-item
  float: left
  margin-right: 0.5em
  &:last-child
    margin-right: 0

.bb8-controls-action
  display: block
  outline: none
  opacity: 0.3
  cursor: pointer
  &:hover, &:focus
    opacity: 1
  .icon
    float: left

.bb8-default-controls
  position: relative
  .bb8-controls
    left: 0
</style>
