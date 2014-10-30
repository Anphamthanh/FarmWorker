class ReportController < ApplicationController    
  def index
    @type = params[:type]
  end
end