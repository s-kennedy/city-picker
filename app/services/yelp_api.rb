class YelpAPI

  def search_by_query(city, query)
    Yelp.client.search(city, { "term": query }).total
  end

end