class YelpAPI

  def search_by_query(city, query)
    response = Yelp.client.search(city, { "term": query }).total
    puts  "this is the reponse fro YelpAPI query!"
    puts response
  end

end