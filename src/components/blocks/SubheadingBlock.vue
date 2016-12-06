<template>
  <div class="bb8-block">
    <input :value="block.fields[0].content" @blur="updateText($event)" @keyup.delete="removeBlock($event)" class="bb8-form-control bb8-block-subheadline" placeholder="…" required>
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
    updateText: (event) ->
      this.block.fields[0].content = event.target.value

    removeBlock: (event) ->
      return if event.target.value.length > 0
      eventBus.$emit('bb8-remove-block', this.index)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-subheadline
  appearance: none
</style>
