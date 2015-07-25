class TypeformController < ApplicationController

  def intro_form
    form_builder = TypeformBuilder.new
    form_builder.intro_form
  end

end
