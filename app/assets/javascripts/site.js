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

  getYelpSearchData("bars", "Barcelona");

