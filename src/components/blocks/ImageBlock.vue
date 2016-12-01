<template>
  <div>
    <label>Image</label>
    <input name="file" required type="file" v-on:change="updateImage($event)">
    <img :src="block.fields[1].content">
    <label>Alt</label>
    <input :value="block.fields[0].content" required v-on:input="updateText($event.target.value)">
    <controls :index="index"></controls>
    <hr>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'single-image'

  mixins: [blockMixin]

  data: -> {
    fields: [{
      type: 'text'
      content: ''
    }, {
      type: 'image'
      content: ''
    }]
  }

  methods: {
    updateImage: (event) ->
      file = event.target.files[0]

      that = this
      reader = new FileReader()
      reader.onloadend = (e) ->
        that.block.fields[1].content = e.target.result if e.target.readyState == FileReader.DONE
      reader.readAsDataURL(file)
  }
}
</script>

<style lang='sass?indentedSyntax=true'>
</style>
