# Authentication System Rails v6.0.2

# Install Materialize-Css

1. `yarn add jquery materialize-css`
2. Create file **application.scss** inside app\javascript\packs\ by creating folder as **stylesheets**. Finally as _app\javascript\packs\stylesheets\application.scss_
3. Import **@import 'materialize-css/dist/css/materialize';** inside application.scss
4. Import the following inside app\javascript\packs\application.js
```
require('jquery')

import "./stylesheets/application";
import "materialize-css/dist/js/materialize";

$(document).on('turbolinks:load', function () {
    $('.sidenav').sidenav();        //javascript functions
});
```
5. Make the environment file config\webpack\environment.js as
```
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery'
}))

module.exports = environment
```