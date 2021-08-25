class StaticController < ApplicationController
  def home
    about = 'This is the API for tracking deals and premium collected by sales executives in a fictitious Insurance
            company'
    render json: { about: about, status: "It's working!!" }
  end
end
