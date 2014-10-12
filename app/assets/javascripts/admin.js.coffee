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
  $("#content").on "click", "button#add_competence_group", ->
    container = $(this).parents("div.panel").children("div.panel-body")
    max_pos = find_max_position
    $.ajax
      type: "GET",
      dataType: "html" # Для корректного получения данных необходимо добавить эту строку
      data: {position: max_pos}
      url: "./new_competence_group",
      success: (data) ->
        container.append(data)
find_max_position = ->
  max = 0
  $("#admin_competence_groups").find("div.panel-body.admin_competence_group strong").each ->
    if $(this).data("groupPosition") > max
      max = $(this).data("groupPosition")
  max