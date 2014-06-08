// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require lib/jquery.raty
//= require lib/letsrate
//= require_tree .

$(document).ready(function() {
    $(".fancybox").click(function() {
      $.fancybox({
          'padding'   : 0,
          'autoScale'   : true,
          'transitionIn'  : 'none',
          'transitionOut' : 'none',
          'title'     : this.title,
          'width'   : 680,
          'height'    : 495,
          'href'      : this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
          'type'      : 'swf',
          'swf'     : {
               'wmode'    : 'transparent',
            'allowfullscreen' : 'true'
          }
        });

      return false;
    });

    $(".nav").children("li").hover(
      function(){
        $(this).addClass("active");
      },
      function(){
        $(this).removeClass("active");
      }
    );
});