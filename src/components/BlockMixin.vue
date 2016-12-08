<script lang="coffee">
import Controls from './Controls.vue'

export default {
  name: 'block-mixin'

  props: ['block', 'index', 'blockTypes']

  components: {
    Controls
  }

  created: ->
    this.block.fields = this.fields if _.size(this.block.fields) <= 0
}
</script>
