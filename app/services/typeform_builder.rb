class FormBuilder

  def intro_form
    query = {
      "title": "City Picker",
      "webhook_submit_url": "http://20bbdb89.ngrok.com/typeform_results",
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
    headers = { "X-API-TOKEN" => "56e3b81325add8b5f48645d27eaf7fd3"}
    response = HTTParty.post('https://api.typeform.io/v0.3/forms/', query: query, headers: headers)
    render json: response.body
  end
  
end