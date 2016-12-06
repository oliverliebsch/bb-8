<script lang="coffee">
import headingkMixin from './HeadingMixin.vue'

export default {
  name: 'heading'

  mixins: [headingkMixin]

  data: -> {
    blockCss: 'heading'
  }
}
</script>
