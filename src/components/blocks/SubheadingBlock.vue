<template>
  <div class="bb8-block">
    <input :value="block.fields[0].content" @blur="updateText($event.target.value)" class="bb8-form-control bb8-block-subheadline" placeholder="…" required>
    <controls :index="index" :block-types="blockTypes"></controls>
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

  methods: {
    updateText: (text) ->
      this.block.fields[0].content = text
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-subheadline
  appearance: none
</style>
