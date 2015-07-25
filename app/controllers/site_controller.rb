class SiteController < ApplicationController

  def index
  end

  def yelp_search
    search = YelpAPI.new
    search_result = search.search_by_query(params[:query], params[:city])
    render :json => search_result
  end
  
end
