class YelpAPI

  def search_by_query(query, city)
    Yelp.client.search(city, { term: query })
  end

end