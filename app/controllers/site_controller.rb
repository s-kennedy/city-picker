class SiteController < ApplicationController

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
      "webhook_submit_url": "http://6585b19e.ngrok.io",
      "fields": [
        {
          "type": "short_text",
          "question": "What is your name?"
        },
        {
          "type": "short_text",
          "question": "Name two cities you'll like to go. (Separate it by a comma)"
        },
        {
          "type": "multiple_choice",
          "question": "What's your motive to change city?",
          "description": "On most days...",
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


  def work_typeform(url)
    query = {
      "title": "Work",
      "webhook_submit_url": url,
      "fields": [
        {
          "type": "multiple_choice",
          "question": "What do you care about the most?",
          "required": false,
          "choices": [
            {
              "label": "Coworking Spaces"
            },
            {
              "label": "Cafés with wi-fi"
            },
            {
              "label": "Food"
            },
            {
              "label": "Nightlife"
            },
            {
              "label": "Local Services"
            },
          ]
        }
      ]
    }
    headers = { "X-API-TOKEN" => "56e3b81325add8b5f48645d27eaf7fd3"}
    response = HTTParty.post('https://api.typeform.io/v0.3/forms/', query: query, headers: headers)
    render json: response.body
  end

  def study_typeform(url)
    query = {
      "title": "Study",
      "webhook_submit_url": url,
      "fields": [
        {
          "type": "multiple_choice",
          "question": "What do you care about the most?",
          "required": false,
          "choices": [
            {
              "label": "Active life"
            },
            {
              "label": "Bars"
            },
            {
              "label": "Nightlife"
            },
            {
              "label": "Food"
            },
            {
              "label": "Local Services"
            },
            {
              "label": "Restaurants"
            }
          ]
        }
      ]
    }
    headers = { "X-API-TOKEN" => "56e3b81325add8b5f48645d27eaf7fd3"}
    response = HTTParty.post('https://api.typeform.io/v0.3/forms/', query: query, headers: headers)
    render json: response.body
  end

   def travel_typeform(url)
    query = {
      "title": "Study",
      "webhook_submit_url": url,
      "fields": [
        {
          "type": "multiple_choice",
          "question": "What do you care about the most?",
          "required": false,
          "choices": [
            {
              "label": "Hotels & Travel"
            },
            {
              "label": "Active life"
            },
            {
              "label": "Bars"
            },
            {
              "label": "Nightlife"
            },
            {
              "label": "Food"
            },
            {
              "label": "Local Services"
            },
            {
              "label": "Restaurants"
            },
            {
              "label": "Shopping"
            },
            {
              "label": "Arts & Entertainment"
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

  end

end

