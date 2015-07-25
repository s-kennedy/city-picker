class SiteController < ApplicationController
  protect_from_forgery :except => :results

  def index
  end

  def results
  end

  def yelp_search
    city = params[:city]
    query = params[:query]
    response = Yelp.client.search(city, { term: query })
    render json: response
  end
  
end

