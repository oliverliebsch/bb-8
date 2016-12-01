<template>
  <div>
    <label>Text</label>
    <textarea @input="updateText($event.target.value)" required>{{block.fields[0].content}}</textarea>
    <controls :index="index"></controls>
    <hr>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'text'

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
