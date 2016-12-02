<template>
  <div class="bb8-controls">
    <a @click="toggleControls()" class="bb8-controls-toggle">+</a>
    <ul v-if="showControls" class="bb8-controls-block-types">
      <li class="bb8-controls-item">
        <a @click="addBlock('heading')" class="bb8-controls-action">Heading</a>
      </li>
      <li class="bb8-controls-item">
        <a @click="addBlock('subheading')" class="bb8-controls-action">Subheading</a>
      </li>
      <li class="bb8-controls-item">
        <a @click="addBlock('text')" class="bb8-controls-action">Text</a>
      </li>
      <li class="bb8-controls-item">
        <a @click="addBlock('image')" class="bb8-controls-action">Image</a>
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

  props: ['index']

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
      eventBus.$emit('bb8-add-block', { blocktype: type, index: this.index })
      this.showControls = false
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-controls
  position: absolute
  bottom: 0
  left: -24px
  &::after
    display: block
    content: ""
    clear: both

.bb8-controls-toggle
  display: block
  float: left
  width: 24px
  opacity: 0.3
  font-weight: bold
  text-align: center
  cursor: pointer
  &:hover, &:focus
    opacity: 1

.bb8-controls-block-types
  float: left
  margin: -1em 0 0
  padding: 1em
  background-color: #f8f8f8
  list-style-type: none

.bb8-controls-item
  float: left
  margin-right: 0.5em
  &:last-child
    margin-right: 0

.bb8-controls-action
  opacity: 0.3
  cursor: pointer
  &:hover, &:focus
    opacity: 1

.bb8-default-controls
  position: relative
</style>
