class CoursesController < ApplicationController
  def index 
    @courses = [] 
    Course.all.each do |course|
      @courses << ["#{course.name}:", course.count_courses] 
    end
    end
end 