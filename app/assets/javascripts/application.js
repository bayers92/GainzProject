// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .


// offcanvas nav preferences
$(document).foundation({
  offcanvas : {
    // Sets method in which offcanvas opens.
    // [ move | overlap_single | overlap ]
    open_method: 'move', 
    // Should the menu close when a menu link is clicked?
    // [ true | false ]
    close_on_click : true
  }
});

function goBack() {
    window.history.back();
}



$("#note-button").click(function(){
    $("#note-field").toggle();
});

$(function(){ $(document).foundation(); });