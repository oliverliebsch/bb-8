<template>
  <div>
    <label>Heading</label>
    <input :value="block.fields[0].content" @input="updateText($event.target.value)" required>
    <controls :index="index"></controls>
    <hr>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'heading'

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
