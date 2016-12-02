<template>
  <div class="bb8">
    <textarea class="bb8-output" v-model="output"></textarea>
    <div class="bb8-default-controls">
      <controls :index="-1"></controls>
    </div>
    <component :index="index" :initialData="block" :is="block.blocktype + '-block'" :key="block.id" v-for="(block, index) in blocks"></component>
  </div>
</template>

<script lang="coffee">
import Controls from './components/Controls.vue'
import HeadingBlock from './components/blocks/HeadingBlock.vue'
import SubheadingBlock from './components/blocks/SubheadingBlock.vue'
import TextBlock from './components/blocks/TextBlock.vue'
import ImageBlock from './components/blocks/ImageBlock.vue'

export default {
  name: 'bb8'

  data: -> {
    blocks: []
    ids: []
    output: ''
  }

  props: ['initialJson']

  components: {
    Controls
    HeadingBlock
    SubheadingBlock
    TextBlock
    ImageBlock
  }

  computed: {
    ids: ->
      _.map(this.blocks, 'id').sort()
  }

  created: ->
    blocks = JSON.parse(this.initialJson)

    # The blocks list relies on its child component states
    # so we have to track the list by a unique id instead of the index
    # see `:key='block.id'` in the template
    block.id = blocks.indexOf(block) + 1 for block in blocks

    this.blocks = blocks

    this.compileBlocks()

    eventBus.$on('bb8-add-block', this.addBlock)
    eventBus.$on('bb8-form-submitted', this.compileBlocks)

  methods: {
    createBlockId: ->
      if this.ids.length then _.last(this.ids) + 1 else 1

    addBlock: (newBlock) ->
      this.blocks.splice(newBlock.index + 1, 0, {
        blocktype: newBlock.blocktype,
        id: this.createBlockId()
      })

    compileBlocks: ->
      # TODO: Remove ids?
      this.output = JSON.stringify(this.blocks)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
.bb8
  padding-left: 24px

.bb8-output
  display: none

.bb8-block
  position: relative
  padding: 0 0 1.5em 0
  &::after
    display: block
    content: ""
    clear: both

.bb8-form-control
  display: block
  width: 100%
  margin: 0
  padding: 0 0.25em
  border: none
  outline: 0
  background-color: transparent
  font: inherit
  text-indent: 1px
  line-height: inherit
  color: inherit
</style>
