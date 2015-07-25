class YelpAPI

  def search_by_query(query, city)
    response = Yelp.client.search(city, { term: query })
    puts response
  end

end