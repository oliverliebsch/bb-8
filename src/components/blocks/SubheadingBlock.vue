<template>
  <div>
    <label>Subheading</label>
    <input :value="block.fields[0].content" required v-on:input="updateText($event.target.value)">
    <controls :index="index"></controls>
    <hr>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'subheading'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }]
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
</style>
