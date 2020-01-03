// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

require("jquery");

// https://www.npmjs.com/package/webpack-jquery-ui
require('webpack-jquery-ui/autocomplete');
require('webpack-jquery-ui/css');  //ommit, if you don't want to load basic css theme

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
  
  // used from application_helper::link_to_add_fields
  $('main').on('click', '[data-add-fields]', function(event) {
    let time = new Date().getTime();
    let regexp = new RegExp($(this).data('id'), 'g');
    let targetId = '#' + $(this).data("target-id");
    $($(this).data('fields').replace(regexp, time))
      .hide()  
      .appendTo(targetId)
      .animate({duration: 250, opacity: 'show', height: 'show'});

    event.preventDefault();
  });

  $('main').on('click', '[data-collapse_target]', function(event) {
    event.preventDefault();
    let collapse_target = $(this).data('collapse_target');
    let expand_target = $(this).data('expand_target');
    let parent = $(this).data('collapse_parent');
    let parent_height = $(parent).height();
    $(parent).height(parent_height);

    let duration = 40;

    $(collapse_target).animate(
      {duration: duration, height: 'hide', opacity: 'hide'},
      {complete: function(){$(collapse_target).addClass("jr-hidden");}}
    );
    $(expand_target).removeClass("jr-hidden");
    $(expand_target).animate(
      {duration: duration, height: 'show',opacity: 'show'},
    );
    $(parent).animate(
      {duration: duration, height: $(expand_target).get(0).scrollHeight},
      {complete: function(){$(parent).height('auto')}}
    );
  });

  const dataList = function(request, response) {
    $.ajax({
      url: '/operation/titles.json?q=' + request.term,
      dataType: 'json',
      type: 'GET',
      cache: true,
      success: function(data) {
        response(data['titles']);
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        response(['']);
      }
    });
  }

  $('main').on('keydown.autocomplete', '[data-operation-title-autocomplete]', function() {
    $(this).autocomplete({
      source: dataList,
      autoFocus: true,
      delay: 300,
      minLength: 2
    });
  });
});
