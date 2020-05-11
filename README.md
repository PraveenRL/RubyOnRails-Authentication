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
6. Change **stylesheet_link_tag** to **stylesheet_pack_tag** in app\views\layouts\application.html.erb

# Procedure
1. Generate user migration `rails g migration create_users`
2. Paste following in created migration file
```
create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.timestamps
```
3. Create a file in models as **user.rb** and paste the following
```
before_save { self.email = email.downcase }
    validates :firstname, presence: true, length: { minimum: 3, maximum: 30 }
    validates :lastname, presence: true, length: { minimum: 3, maximum: 30 }
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 100 },
                      format: { with: VALID_EMAIL_REGEX }
    has_secure_password
```
4. 