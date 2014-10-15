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
    parent.children("select").attr("disabled", "disabled")
    parent.children("input").attr("disabled", "disabled")
    parent.children("button.group_competence_delete").attr("disabled", "disabled")
    parent.parent().attr("data-group-visible", "false")

  $("#content").on "click", "button.group_competence_show", ->
    parent = $(this).parent()
    $(this).hide()
    parent.children("button.group_competence_hide").show()
    parent.children("select").removeAttr("disabled")
    parent.children("input").removeAttr("disabled")
    parent.children("button.group_competence_delete").removeAttr("disabled")
    parent.parent().attr("data-group-visible", "true")

  $("#content").on "click", "button.group_competence_delete", ->
    me = $(this)
    group = me.parents "div.admin_competence_group"
    if confirm("Вы действительно хотите удалить группу компетенций?")
      me.attr("disabled", "disabled")
      group.attr("data-group-deleted", "true")
      group.fadeOut()

  $("#content").on "click", "button#competence_group_cancel", ->
    $(this).parents("div.panel").children("div#admin_competence_groups").load("./competences #admin_competence_groups div.admin_competence_group")

  $("#content").on "click", "button#competence_group_apply", ->
    container = $(this).parents("div.panel").children("div#admin_competence_groups")
    dom_groups = container.children("div.admin_competence_group")
    groups = []
    dom_groups.each ->
      groups.push
        id: $(this).attr("data-group-id"),
        position: $(this).attr("data-group-position"),
        color: $(this).find("select[name='group_color'] option:selected").val(),
        name: $(this).find("input[name='group_name']").val(),
        visible: $(this).attr("data-group-visible"),
        deleted: $(this).attr("data-group-deleted")

    $.ajax
      type: "POST",
#      dataType: "html",
      url: "./update_competence_groups",
      data: {groups: groups},
      success: (data) ->
        console.log data

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