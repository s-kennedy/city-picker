class TypeformBuilder

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
    create_typeform(query)

  end

  def work_typeform
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
    create_typeform(query)
    

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
    create_typeform(query)
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
    create_typeform(query)
  end

  def create_typeform(query)
    headers = { "X-API-TOKEN" => ENV["typeform_api_token"]}
    response = HTTParty.post('https://api.typeform.io/v0.3/forms/', query: query, headers: headers)
    response.body

  end

end
