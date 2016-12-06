<script lang="coffee">
import headingkMixin from './HeadingMixin.vue'

export default {
  name: 'subheading'

  mixins: [headingkMixin]

  data: -> {
    blockCss: 'subheading'
  }
}
</script>
