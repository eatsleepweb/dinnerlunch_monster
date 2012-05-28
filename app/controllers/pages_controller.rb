class PagesController < ApplicationController
  def index
  end
  
  def find_dinners
    @lunch = Meal.find_by_name(params[:lunch])
    
    if (!@lunch.nil?)
      respond_to do |format|  
        format.js 
        format.json
        format.html {
          Rails.logger.debug("Got an html request")
        } 
      end
    else
      respond_to do |format|
        format.js
        format.json
        format.html {
          Rails.logger.debug("Got an html request")
        }
      end
    end
    nil
  end

end
