//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require sortable
//= require jquery.remotipart
//= require ckeditor-jquery
//= require turbolinks
//= require_tree .

jQuery ->
 $("#todo_items").sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'));


  