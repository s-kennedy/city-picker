class SiteController < ApplicationController

  def index
  end

  def yelp_search
    city = params[:city]
    query = params[:query]
    response = Yelp.client.search(city, { term: query })
    render json: response
  end
  
  def typeform
  end


  def results
  end

end

