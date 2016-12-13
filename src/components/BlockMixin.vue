<script lang="coffee">
import Controls from './Controls.vue'

export default {
  name: 'block-mixin'

  props: ['block', 'index', 'blockTypes']

  components: {
    Controls
  }

  created: ->
    this.block.fields = this.fields if Object.keys(this.block.fields).length <= 0
}
</script>
