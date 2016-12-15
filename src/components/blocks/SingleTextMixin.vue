<template>
  <div class="bb8-block">
    <input v-model="block.fields.content" @keydown.delete="removeBlock($event)" :class="['bb8-form-control', 'bb8-block-' + blockCss]" placeholder="…" required>
    <controls :index="index" :block-types="blockTypes"></controls>
  </div>
</template>

<script lang="coffee">
import eventBus from './../../EventBus.vue'
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'heading-mixin'

  mixins: [blockMixin]

  data: -> {
    fields: {
      content: ''
    }
  }

  mounted: ->
    this.$el.firstChild.focus() if this.block.fields.content.length <= 0

  methods: {
    removeBlock: (event) ->
      return if event.target.value.length > 0
      this.$emit('remove-block', this.index)
  }
}
</script>
