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
    
    puts "#{@city1} has #{@city1_bars} bars and #{@city2} has #{@city2_bars}."
    puts "#{@city1} has #{@city1_swimmingpools} swimming pools and #{@city2} has #{@city2_swimmingpools}."
    puts "#{@city1} has #{@city1_paintball} paintball arenas and #{@city2} has #{@city2_paintball}."
    puts "#{@city1} has #{@city1_museums} museums and #{@city2} has #{@city2_museums}."
    puts "#{@city1} has #{@city1_mcdonalds} McDonalds and #{@city2} has #{@city2_mcdonalds}."

    result = Result.new
    result.city1 = @city1
    result.city2 = @city2
    result.city1_bars = @city1_bars
    result.city1_museums = @city1_museums
    result.city1_mcdonalds = @city1_museums
    result.city1_paintball = @city1_paintball
    result.city1_swimmingpools = @city1_swimmingpools
    result.city2_bars = @city2_bars
    result.city2_museums = @city2_museums
    result.city2_mcdonalds = @city2_museums
    result.city2_paintball = @city2_paintball
    result.city2_swimmingpools = @city2_swimmingpools
    result.save
  end


end
