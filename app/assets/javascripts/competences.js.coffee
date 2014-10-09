$(document).on "page:change", ->
  $("#content").on "click", "div.competence_header", ->
    me = $(this)
    competence_hover = me.children "div.competence_hover"
    competence = me.parent()
    if competence_hover.hasClass "plus"
      competence_hover
        .removeClass "plus"
        .addClass "minus"
      competence_hover.css "background-image", "minus-hover.png"
      competence
        .children "div.competence_description"
        .show()
    else
      competence_hover
        .removeClass "minus"
        .addClass "plus"
      competence_hover.css "background-image", "plus-hover.png"
      competence
        .children "div.competence_description"
        .hide()