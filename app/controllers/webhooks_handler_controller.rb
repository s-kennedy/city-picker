class WebhooksHandlerController < ApplicationController
  protect_from_forgery :except => :receive_results

  def intro_form

    puts "responses from Typeform!!"
    ActionController::Parameters.permit_all_parameters = true

    @name = params["answers"][0]["data"]["value"]
    @city1 = params["answers"][1]["data"]["value"]
    @city2 = params["answers"][2]["data"]["value"]
    @query1 = params["answers"][3]["data"]["value"]
    @query2 = params["answers"][4]["data"]["value"]
    @query3 = params["answers"][5]["data"]["value"]

    yelp = YelpAPI.new
    @city1_bars = yelp.search_by_query(@city1, @query1)
    @city1_swimmingpools = yelp.search_by_query(@city1, @query2)
    @city1_paintball = yelp.search_by_query(@city1, @query3)
    @city1_mcdonalds = yelp.search_by_query(@city1, "McDonalds")

    @city2_bars = yelp.search_by_query(@city2, @query1)
    @city2_swimmingpools = yelp.search_by_query(@city2, @query2)
    @city2_paintball = yelp.search_by_query(@city2, @query3)
    @city2_mcdonalds = yelp.search_by_query(@city2, "McDonalds")
    
    puts "responses from Yelp!!"

    result = Result.new
    result.city1 = @city1
    result.city2 = @city2
    result.city1_bars = @city1_bars
    result.city1_mcdonalds = @city1_mcdonalds
    result.city1_paintball = @city1_paintball
    result.city1_swimmingpools = @city1_swimmingpools
    result.city2_bars = @city2_bars
    result.city2_mcdonalds = @city2_mcdonalds
    result.city2_paintball = @city2_paintball
    result.city2_swimmingpools = @city2_swimmingpools
    result.query1 = @query1
    result.query2 = @query2
    result.query3 = @query3
    result.save

    render status: 200

  end


end
