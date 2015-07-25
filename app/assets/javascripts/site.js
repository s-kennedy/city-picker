// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(function(){

    var getTypeform = function() {
        $.ajax({
            url: "/typeform",
            data: '',
            success: function(response) {
              console.log(response);
                $("#typeform").attr("src", response.links[1].href);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    getTypeform();

})