class SiteController < ApplicationController
  protect_from_forgery :except => :results

  def index
  end

  def yelp_search
    city = params[:city]
    query = params[:query]
    response = Yelp.client.search(city, { term: query })
    render json: response
  end
  
  def typeform
    query = {
      "title": "City Picker",
      "webhook_submit_url": ENV["ngrok_url"],
      "fields": [
        {
          "type": "short_text",
          "question": "What is your name?"
        },
        {
          "type": "short_text",
          "question": "Think of two cities you'd like to go. What is the first one?"
        },
        {
          "type": "short_text",
          "question": "What is the second city?"
        },
        {
          "type": "multiple_choice",
          "question": "Why are you changing cities?",
          "required": false,
          "choices": [
            {
              "label": "Work"
            },
            {
              "label": "Study"
            },
            {
              "label": "Travel"
            }
          ]
        }
      ]
    }
    headers = { "X-API-TOKEN" => "56e3b81325add8b5f48645d27eaf7fd3"}
    response = HTTParty.post('https://api.typeform.io/v0.3/forms/', query: query, headers: headers)
    render json: response.body

  end

  def results
    response = params[:answers]
    name = response[0].value
    print name
    render json: name
  end

end

