# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  group_start_pos = 0
  group_end_pos = 0
  $("#admin_competence_groups").sortable({
    start: (event, ui) ->
      group_start_pos = ui.item.index()
    stop: (event, ui) ->
      group_end_pos = ui.item.index()
      reordering_groups(group_start_pos, group_end_pos, ui.item)
  })

  $("#admin_competence_groups").disableSelection()

  $("#content").on "change", "select[name='group_color']", ->
    container = $(this).parents(".panel.admin_competence_group")
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

  $("#content").on "click", "button.group_competence_hide", ->
    parent = $(this).parent()
    $(this).hide()
    parent.children("button.group_competence_show").show()

  $("#content").on "click", "button.group_competence_show", ->
    parent = $(this).parent()
    $(this).hide()
    parent.children("button.group_competence_hide").show()


find_max_position = ->
  max = 0
  $("#admin_competence_groups").find("div.panel.admin_competence_group").each ->
    if $(this).data("groupPosition") > max
      max = $(this).data("groupPosition")
  max

reordering_groups = (start, end, group) ->
  groups = group.parent().children(".panel.admin_competence_group")
  if start != end
    new_pos = 1040
    groups.each (index, el) ->
      change_group_position_and_letter($(el), new_pos)
      new_pos++

change_group_position_and_letter = (group, new_pos) ->
  letter = String.fromCharCode(new_pos)
  group.find(".panel-body > strong").text letter + ". "
  group.attr("data-group-position", new_pos)