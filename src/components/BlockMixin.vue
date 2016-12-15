<script lang="coffee">

export default {
  name: 'block-mixin'

  props: ['block', 'index']

  created: ->
    this.block.fields = this.fields if Object.keys(this.block.fields).length <= 0
}
</script>
