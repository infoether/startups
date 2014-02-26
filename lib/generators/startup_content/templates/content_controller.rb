class ContentController < ApplicationController
  
  def placeholder
    render :action => params[:name]
  end
  
end
