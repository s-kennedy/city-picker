class WebhooksHandlerController < ApplicationController
  protect_from_forgery :except => :receive_results

  def receive_results

    puts "got responses from Typeform!!"
    ActionController::Parameters.permit_all_parameters = true
    user_response = {}
    user_response[:name] = params["answers"][0]["data"]["value"]
    user_response[:city1] = params["answers"][1]["data"]["value"]
    user_response[:city2] = params["answers"][2]["data"]["value"]
    user_response[:query1] = params["answers"][3]["data"]["value"]
    user_response[:query2] = params["answers"][4]["data"]["value"]
    user_response[:query3] = params["answers"][5]["data"]["value"]
    user_response[:response_id] = params["token"]
    get_yelp_data(user_response)
    puts "getting info from yelp... "

  end

  def get_yelp_data

    yelp = YelpAPI.new

    user_response[:city1_query1] = yelp.search_by_query(user_response[:city1], user_response[:query1])
    user_response[:city1_query2] = yelp.search_by_query(user_response[:city1], user_response[:query2])
    user_response[:city1_query3] = yelp.search_by_query(user_response[:city1], user_response[:query3])
    user_response[:city1_mcdonalds] = yelp.search_by_query(user_response[:city1], "McDonalds")


    user_response[:city2_query1] = yelp.search_by_query(user_response[:city2], user_response[:query1])
    user_response[:city2_query2] = yelp.search_by_query(user_response[:city2], user_response[:query2])
    user_response[:city2_query3] = yelp.search_by_query(user_response[:city2], user_response[:query3])
    user_response[:city2_mcdonalds] = yelp.search_by_query(user_response[:city2], "McDonalds")
    puts "got responses from yelp!"
    save_response(user_response)

  end

  def save_response
    puts "saving user response"
    Result.create(user_response).
  end

  def check_submission
    submission = Result.find_by response_id: user_response[:response_id]
    render json: submission.present?
  end


end
