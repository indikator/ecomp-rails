# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  $("#admin_competence_groups").sortable({
    start: (event, ui) ->
      console.log "Start position: #{ui.item.index()}"
    stop: (event, ui) ->
      console.log "New position: #{ui.item.index()}"
  })
  $("#admin_competence_groups").disableSelection()
  $("#content").on "change", "select[name='group_color']", ->
    container = $(this).parent(".panel-body")
    color = $(this).children("option:selected").data "color"
    container.css("background-color", color)