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

  methods: {
    updateText: (text) ->
      this.block.fields[0].content = text
  }
}
</script>
