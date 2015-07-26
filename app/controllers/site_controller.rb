class SiteController < ApplicationController
  protect_from_forgery :except => :result

  def index
  end

  def result
    @result = Result.last
    # @result = Result.find_by response_id: id
  end

end

