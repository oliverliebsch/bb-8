<template>
  <div class="bb8-block">
    <input name="file" required type="file" @change="updateImage($event)">
    <img :src="block.fields[1].content" class="bb8-block-image-preview">
    <input :value="block.fields[0].content" @input="updateAltText($event.target.value)" class="bb8-form-control bb8-block-image-alt" placeholder="Describe the image" required>
    <controls :index="index"></controls>
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
    updateAltText: (text) ->
      this.block.fields[0].content = text

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
.bb8-block-image-preview
  display: block
  width: auto
  max-width: 100%

.bb8-block-image-alt
  appearance: none
</style>
