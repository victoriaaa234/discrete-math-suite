class InductionController < ApplicationController
  def generate_problem
    @problem = {test: "hello"}
    render :json => problem
  end

  def index
    user = User.find(session[:user_id])
    puts("test")

    
    user[:num_attempt] += 1
    puts(user[:num_attempt])
    user.save()
  end
end
