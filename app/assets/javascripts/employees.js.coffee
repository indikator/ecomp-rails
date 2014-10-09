$(document).on "page:change", ->
  $("#content").on("click", ".panel-heading", ->
    parent = $(this).parent()
    if parent.hasClass("panel-collapse")
      parent.parent().children(".panel").addClass("panel-collapse")
      parent.removeClass("panel-collapse")
    else parent.addClass("panel-collapse")
    false
  )