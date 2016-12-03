<template>
  <div class="bb8-block">
    <div @blur="updateText($event)" v-html="block.fields[0].content" class="bb8-form-control bb8-block-text" required></div>
    <controls :index="index"></controls>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'text'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'html'
      content: ''
    }]
  }

  mounted: ->
    new MediumEditor(this.$el.querySelector('.bb8-block-text'), {
      spellcheck: false
      disableExtraSpaces: true
      toolbar: {
        allowMultiParagraphSelection: true
        buttons: ['bold', 'italic', 'anchor']
      }
      anchor: {
        targetCheckbox: false
      }
    })

  methods: {
    updateText: (event) ->
      this.block.fields[0].content = event.target.innerHTML
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8-block-text
  overflow: auto
  -webkit-overflow-scrolling: touch
  height: auto

</style>
