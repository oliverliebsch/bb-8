<template>
  <div class="bb8-block">
    <input v-model="block.fields.quote" @keydown.delete="removeBlock($event)" class="bb8-form-control bb8-block-quote" placeholder="Quote" required>
    <input v-model="block.fields.cite" class="bb8-form-control bb8-block-quote-cite" placeholder="Cite">
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'quote'

  mixins: [blockMixin]

  data: -> {
    fields: {
      quote: ''
      cite: ''
    }
  }

  mounted: ->
    this.$el.querySelector('.bb8-form-control').focus() if this.block.fields.quote.length <= 0

  methods: {
    removeBlock: (event) ->
      return if event.target.value.length > 0
      this.$emit('remove-block', this.index)
  }
}
</script>

<style lang='sass'>
.bb8-block-quote
  margin-bottom: 0.5em

.bb8-block-quote-cite
  font-style: italic
</style>
