// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// https://qiita.com/rhistoba/items/f724dae231d7e28bf477
import 'bootstrap'
// import '@fortawesome/fontawesome-free/js/all'
import '../src/application.scss'

$.fn.replaceWithPush = function(a) {
  var $a = $(a);

  this.replaceWith($a);
  return $a;
};

$(document).on("turbolinks:load", function() {  
  $('[data-add-fields]').click(function(event) {
    let time = new Date().getTime();
    let regexp = new RegExp($(this).data('id'), 'g');
    let targetId = '#' + $(this).data("target-id");
    $($(this).data('fields').replace(regexp, time))
      .hide()  
      .appendTo(targetId)
      .animate({duration: 250, opacity: 'show', height: 'show'});

    event.preventDefault();
  });

  $('[data-collapse_target]').click(function(event) {
    event.preventDefault();
    let collapse_target = $(this).data('collapse_target');
    let expand_target = $(this).data('expand_target');
    let parent = $(this).data('collapse_parent');
    let parent_height = $(parent).height();
    $(parent).height(parent_height);

    $(collapse_target).animate(
      {duration: 70, height: 'hide', opacity: 'hide'},
      {complete: function(){$(collapse_target).addClass("jr-hidden");}}
    );
    $(expand_target).removeClass("jr-hidden");
    $(expand_target).animate(
      {duration: 70, height: 'show',opacity: 'show'},
    );
    $(parent).animate(
      {duration: 70, height: $(expand_target).get(0).scrollHeight},
      {complete: function(){$(parent).height('auto');}}
    );
  })
});
