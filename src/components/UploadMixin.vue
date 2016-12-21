<script lang="coffee">
export default {
  name: 'upload-mixin'

  props: ['config']

  methods: {
    uploadImage: (event, ajax = true) ->
      vm = this

      return if event.target.files.length <= 0 || !event.target.files[0]
      file = event.target.files[0]

      if ajax
        fd = new FormData()
        fd.append('image[file]', file)

        xhr = new XMLHttpRequest()
        xhr.open(this.config.httpMethod, this.config.imageApi)

        for header, value of this.config.apiHeaders
          xhr.setRequestHeader(header, value)

        xhr.onload = ->
          if this.status == 200
            resp = JSON.parse(this.response)
            vm.block.fields.image = resp.file.url
            vm.block.fields.image_id = resp.image_id
          else
            vm.block.fields.image = ''
            vm.block.fields.image_id = ''

        xhr.send(fd)

      else
        reader = new FileReader()
        reader.onloadend = (e) ->
          vm.block.fields.image = e.target.result if e.target.readyState == FileReader.DONE
        reader.readAsDataURL(file)
  }
}
</script>
