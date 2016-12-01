<template>
  <div>
    <a @click="toggleControls()">+</a>
    <ul v-if="showControls">
      <li><a @click="addBlock('heading')">Heading</a></li>
      <li><a @click="addBlock('subheading')">Subheading</a></li>
      <li><a @click="addBlock('text')">Text</a></li>
      <li><a @click="addBlock('image')">Image</a></li>
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
</style>
