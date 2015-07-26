class SiteController < ApplicationController
  protect_from_forgery :except => :result

  def index
  end

  def result
    @result = Result.last
    city1_population = City.find_by(name: @result.city1).population
    city2_population = City.find_by(name: @result.city2).population

  end

end

