// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(function(){

    var Typeform = function() {
        this.form_id;
        this.url;
    }
    
    Typeform.prototype.generateTypeform = function() {
        $.ajax({
            url: "/typeform",
            data: '',
            success: this.renderTypeform.bind(this),
            error: function(error) {
                console.log(error);
            }
        });
    };

    Typeform.prototype.renderTypeform = function(response) {
        $("#typeform-iframe").attr("src", response.links[1].href);
        console.log("new form!");
        // this.closeForm();
    };

    Typeform.prototype.closeForm = function() {
        var form_submitted = false;
        var timeout = setInterval(function() {
            $.ajax({
                url: '/check_submission',
                data: '', 
                success: function(response) {
                    console.log(response);
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }, 1000);
    };

    var intro_form = new Typeform();
    intro_form.generateTypeform();



})