<template>
  <div>
    <a v-on:click="addBlock('heading')">Heading</a>
    <a v-on:click="addBlock('subheading')">Subheading</a>
    <a v-on:click="addBlock('single-image')">Image</a>
  </div>
</template>

<script lang="coffee">
export default {
  name: 'controls'

  props: ['index']

  methods: {
    addBlock: (type) ->
      eventBus.$emit('bb8-add-block', { blocktype: type, index: this.index })
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
</style>
