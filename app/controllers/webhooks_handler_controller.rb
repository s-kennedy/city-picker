class WebhooksHandlerController < ApplicationController
  protect_from_forgery :except => :receive_results
  
  def receive_results
    puts "got it!!"
    ActionController::Parameters.permit_all_parameters = true
    case response.id
    when "SIx1WT4E5wQzLA"
      intro_form(response)
    end

    end
  end


  def intro_form(response)
    @name = response[0].value
    @city1 = response[1].value
    @city2 = response[2].value
    motive = response[3].value.label
      if motive == "Travel"
        @form_id = 
      elsif motive == "Study"
        study_form
      else motive == "Work"
        work_form
      end
      render 'site#results'
  end

  def results
  end

  def study_form
    response = params[:answers]
  end

  def travel_form
    response = params[:answers]
  end

  private

    def results_params
      params.permit(:data, :answers, :id, :token)
    end

end
