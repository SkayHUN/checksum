class PagesController < ApplicationController
  include CheckSum
  # before_action :set_output

  def show
    render template: "pages/home"
  end

  def parse_input
    @output = sum(params[:input])
    render :home
  end

  # def set_output
  #   @output = @input
  #   redirect_to action: :show
  # end
end
