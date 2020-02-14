const { environment } = require("@rails/webpacker");

// Add JQuery to webpacker
const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery"
  })
);

module.exports = environment;
