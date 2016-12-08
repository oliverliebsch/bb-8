module.exports = {
  plugins: [
    require('postcss-smart-import')(),
    require('autoprefixer')({ browsers: ['last 2 versions'] })
  ]
}
