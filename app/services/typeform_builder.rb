class TypeformBuilder

  def intro_form
    query = {
      "title" => "City Picker",
      "webhook_submit_url" => ENV["webhook_url"],
      "fields" => [
        {
          "type" => "short_text",
          "question" => "What is your name?"
        },
        {
          "type" => "short_text",
          "question" => "Think of two cities you'd like to go. What is the first one?"
        },
        {
          "type" => "short_text",
          "question" => "What is the second one?"
        },
        {
          "type" => "short_text",
          "question" => "What do you want to compare?"
        },
        {
          "type" => "short_text",
          "question" => "Something else?"
        },
        {
          "type" => "short_text",
          "question" => "One more thing?"
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
