/**
 * Created by indikator on 08.10.14.
 */
$(document).ready(function () {
    $("#content").on("click", ".panel-heading", function(){
        var parent = $(this).parent();

        if(parent.hasClass("panel-collapse")){
            parent.parent().children(".panel").addClass("panel-collapse");
            parent.removeClass("panel-collapse");
        } else {
            parent.addClass("panel-collapse");
        }

        return false;
    });
});