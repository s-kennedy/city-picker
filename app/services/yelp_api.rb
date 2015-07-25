class YelpAPI

  def search_by_query(query, city)

Yelp.client.search('San Francisco', { term: 'food' })
  end

end