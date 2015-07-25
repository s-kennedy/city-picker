class SiteController < ApplicationController

  def index
  end

  def yelp_search
    city = params[:city]
    query = params[:query]
    response = Yelp.client.search(city, { term: query })
    calc = Calculator.new
    calc.per_capita(response.total, query, city)
  end
  
end
