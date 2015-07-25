class WebhooksHandlerController < ApplicationController
  protect_from_forgery :except => :receive_results

  def intro_form
    puts "got it!!"
    ActionController::Parameters.permit_all_parameters = true
    @name = params["answers"][0]["data"]["value"]
    @city1 = params["answers"][1]["data"]["value"]
    @city2 = params["answers"][2]["data"]["value"]

    yelp = YelpAPI.new
    @city1_bars = yelp.search_by_query(@city1, "bars")
    @city1_swimmingpools = yelp.search_by_query(@city1, "swimming pools")
    @city1_paintball = yelp.search_by_query(@city1, "paintball")
    @city1_museums = yelp.search_by_query(@city1, "museum")
    @city1_mcdonalds = yelp.search_by_query(@city1, "McDonalds")

    @city2_bars = yelp.search_by_query(@city2, "bars")
    @city2_swimmingpools = yelp.search_by_query(@city2, "swimming pools")
    @city2_paintball = yelp.search_by_query(@city2, "paintball")
    @city2_museums = yelp.search_by_query(@city2, "museum")
    @city2_mcdonalds = yelp.search_by_query(@city2, "McDonalds")

  end


end
