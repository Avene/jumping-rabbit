const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    // https://www.npmjs.com/package/webpack-jquery-ui
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery'",
    "window.$": "jquery"
  })
);

module.exports = environment
