<template>
  <div>
    <textarea cols="100" name="text" rows="8" v-model="output"></textarea>
    <controls :index="-1"></controls>
    <hr>
    <div>
      <component :index="index" :initialData="block" :is="block.blocktype" :key="block.id" v-for="(block, index) in blocks"></component>
    </div>
  </div>
</template>

<script lang="coffee">
import Controls from './components/Controls.vue'
import Heading from './components/blocks/Heading.vue'
import Subheading from './components/blocks/Subheading.vue'
import SingleImage from './components/blocks/SingleImage.vue'

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
    Heading
    Subheading
    SingleImage
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
      this.output = JSON.stringify(this.blocks)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
</style>
