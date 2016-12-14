<script lang="coffee">
import singleTextMixin from './SingleTextMixin.vue'

export default {
  name: 'subheading'

  mixins: [singleTextMixin]

  data: -> {
    blockCss: 'subheading'
  }
}
</script>
