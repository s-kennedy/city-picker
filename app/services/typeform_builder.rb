class FormBuilder

  def intro_form
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
    headers = { "X-API-TOKEN" => ENV["typeform_api_token"]}
    response = HTTParty.post('https://api.typeform.io/v0.3/forms/', query: query, headers: headers)
    render json: response.body

  end

  def work_typeform(url)
    query = {
      "title": "Work",
      "webhook_submit_url": ENV["ngrok_url"],
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

  def study_typeform
    query = {
      "title": "Study",
      "webhook_submit_url": ENV["ngrok_url"],
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
  end

  def travel_typeform
    query = {
      "title": "Study",
      "webhook_submit_url": ENV["ngrok_url"],
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
  end

end