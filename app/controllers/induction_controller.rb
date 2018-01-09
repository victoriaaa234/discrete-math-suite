class InductionController < ApplicationController
  def generate_problem
    @problem = {test: "hello"}
    render :json => problem
  end
end
