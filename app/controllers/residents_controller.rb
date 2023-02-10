class ResidentsController < ApplicationController
  def index 
    @residents = Resident.alphabetize
    @age = Resident.average_age
  end

  def show 
    @resident = Resident.find(params[:id])
    @courses = @resident.courses
  end

end
