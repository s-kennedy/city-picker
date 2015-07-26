class SiteController < ApplicationController
  protect_from_forgery :except => :result

  def index
  end

  def result
    @result = Result.last
  end

end

