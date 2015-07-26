// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(function(){

    var Typeform = function() {
        this.form_id;
        this.url;
        this.response_id;
    }
    
    var getTypeform = function() {
        $.ajax({
            url: "/typeform",
            data: '',
            success: function(response) {
              $("#typeform-iframe").attr("src", response.links[1].href);
              console.log("new form!")
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    getTypeform();



})