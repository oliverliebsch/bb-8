<script lang="coffee">
import Controls from './Controls.vue'

export default {
  name: 'block-mixin'

  data: -> {
    block: this.initialData
  }

  props: ['initialData', 'index']

  components: {
    Controls
  }

  created: ->
    _.defaults(this.initialData, {fields: this.fields})
}
</script>
