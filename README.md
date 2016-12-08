# bb-8-2

> An intuitive content editor

## Build setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

## Adding a new block
1. Create a .vue file under `src/components/blocks` starting with a capital letter and ending with `Block.vue`
2. See the existing blocks for reference on how to define a block
3. Import the block in `Bb8.vue` and reference it under `components`
4. Add an .svg with the name `yourblockname-block`
4. Add your new block to the `blockTypes` config option, when creating a new BB8 instance
