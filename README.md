# bb-8

> Converts a textarea into a simple and intuitive content editor

![bb-8](http://oliver-liebsch.de/bb8.gif)

- use predefined blocks to add content
- clean ui
- outputs json
- minimum css
- based on vue.js

## Installation
```
bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

## Getting started
Usually you want to use bb-8 on a textarea in an existing form. But that is not a must.

1. Add vue.js to your page. E.g. from a cdn:
`<script src="//unpkg.com/vue@2.1.6/dist/vue.js"></script>`

2. Add the bb-8 JavaScript build to your page somewhere after vue.js. E.g.:
`<script src="/dist/bb8.js"></script>`

3. Add the id `bb8` on a tag within your markup, e.g. on a form tag:
```
<form id="bb8">
  …
</form>
```

4. Add the bb8 main component inside that element:
```
<form id="bb8">
  <bb8 bb8-config='[]' bb8-initial-data='[]'></bb8>
</form>
```

5. Add your configuration (see bellow) and initial data.

6. Adjust the stylings.

## Configuration
`bb8-config`:
- name (required, string): name of the textarea the output is written to
- blockTypes (optional, array): the blocks you want to use, `["heading", "subheading", …]``

If you use the built-in image, teaser or gallery block:
- imageApi (required, string): your endpoint for uploading images
- httpMethod (required, string): GET, POST…
- apiHeaders (optional, object): if you want to set custom headers for the upload request

## Built-in blocks
- heading
- subheading
- text (contenteditable attribute with [MediumEditor](https://github.com/yabwe/medium-editor)
- image with alt attribute
- video (YouTube, Vimeo)
- teaser (headline + text + image + link)
- gallery
- GitHub Gist
- Twitter tweet

## Adding a new block
1. Create a .vue file under `src/components/blocks` starting with a capital letter and ending with `Block.vue`
2. See the code bellow and existing blocks for further guidance
3. Import the block in `Bb8.vue` and reference it under `components`
4. Add an .svg with the name `yourblockname-block`
4. Add your new block to the `blockTypes` config option, when creating a new BB8 instance

````
<template>
  <div class="bb8-block">
    …
    <slot></slot>
  </div>
</template>

<script lang="coffee">
import blockMixin from './../BlockMixin.vue'

export default {
  name: 'yourblockname'

  mixins: [blockMixin]

  data: -> {
    fields: {
      …
    }
  }

  methods: {
    removeBlock: (event) ->
      this.$emit('remove-block', this.index)
  }
}
</script>

<style></style>
````

At the position of `<slot />` the controls for adding new blocks are inserted.

## License: MIT
Copyright Oliver Liebsch, http://oliver-liebsch.de

The following license applies to all parts of this software except as
documented below:

====

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

====

Some of the icons come from https://material.io/icons/.
All files located in the node_modules directory are
externally maintained libraries used by this software which have their
own licenses; we recommend you read them, as their terms may differ from
the terms above.
