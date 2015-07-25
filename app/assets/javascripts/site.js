// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


  function getYelpSearchData(query, city){
    var data = {
      query: query,
      city: city
    }

    $.ajax({
      url: '/yelp',
      data: data,
      success: function(response) {
        console.log(response);
      },
      error: function(error) {
        console.log(error)
      }
    });
  };

  getYelpSearchData("animal shelters", "Barcelona");

$(function(){


    var fields = {
      "title": "City Picker",
      "webhook_submit_url": "http://6585b19e.ngrok.io",
      "fields": [
        {
          "type": "short_text",
          "question": "What is your name?"
        },
        {
          "type": "multiple_choice",
          "question": "Why do you want us to help you to pick a new city?",
          "description": "Because I want to...",
          "required": false,
          "choices": [
            {
              "label": "Work"
            },
            {
              "label": "Study abroad"
            },
            {
              "label": "Travel"
            }
          ]
        }
      ]
    }


    window.getTypeform = function() {
        $.ajax({
            url: "/typeform",
            data: '',
            success: function(response) {
              console.log(response.links[1].href);
                $("#typeform").attr("src", response.links[1].href);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }


})