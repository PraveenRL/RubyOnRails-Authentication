require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

import "./stylesheets/application";
import "materialize-css/dist/js/materialize";

$(document).on('turbolinks:load', function () {
    $('.sidenav').sidenav();
    $('#error-container').fadeOut(3000);
});
