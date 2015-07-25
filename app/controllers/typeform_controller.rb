class TypeformController < ApplicationController

  def intro_form
    form_builder = TypeformBuilder.new
    render json: form_builder.intro_form
  end

end
