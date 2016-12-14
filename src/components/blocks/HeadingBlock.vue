<script lang="coffee">
import singleTextMixin from './SingleTextMixin.vue'

export default {
  name: 'heading'

  mixins: [singleTextMixin]

  data: -> {
    blockCss: 'heading'
  }
}
</script>
