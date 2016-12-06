<template>
  <div class="bb8-block">
    <input :value="block.fields[0].content" @blur="updateText($event)" @keyup.delete="removeBlock($event)" :class="['bb8-form-control', 'bb8-block-' + blockCss]" placeholder="…" required>
    <controls :index="index" :block-types="blockTypes"></controls>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'heading-mixin'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }]
  }

  mounted: ->
    this.$el.firstChild.focus() if this.block.fields[0].content.length <= 0

  methods: {
    updateText: (event) ->
      this.block.fields[0].content = event.target.value

    removeBlock: (event) ->
      return if event.target.value.length > 0
      eventBus.$emit('bb8-remove-block', this.index)
  }
}
</script>
