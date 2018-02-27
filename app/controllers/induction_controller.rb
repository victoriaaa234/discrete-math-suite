class InductionController < ApplicationController
  def generate_problem
    @problem = {test: "hello"}
    render :json => problem
  end

  def index
    if(session[:user_id])
      user = User.find(session[:user_id])
      puts("test")

      if params[:check]
        if user[:num_correct] == nil
          user[:num_correct] = 1
        else
          user[:num_correct] += 1
        end
      end

      if user[:num_attempt] == nil
        user[:num_attempt] = 1
      else
        user[:num_attempt] += 1
      end
      user.save()
    end
  end
end
