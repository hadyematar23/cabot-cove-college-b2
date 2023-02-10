require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe "#instance methods" do 
    it "should count the number of residents in a particular course" do 
      @hady = Resident.create!(name: "Hady", age: 45, occupation: "lawyer")
      @skydiving = Course.create!(name: "Skydiving")
      @eating = Course.create!(name: "Eating")
      @malena = Resident.create!(name: "Malena", age: 23, occupation: "tour guide")
      @surfing = Course.create!(name: "Surfing")
      @abe = Resident.create!(name: "Abe", age: 34, occupation: "doctor")
      @jordan = Resident.create!(name: "Michael", age: 60, occupation: "NBA Player")
  
      ResidentCourse.create!(resident_id: @hady.id, course_id: @skydiving.id)
      ResidentCourse.create!(resident_id: @hady.id, course_id: @surfing.id)
      ResidentCourse.create!(resident_id: @malena.id, course_id: @surfing.id)
      ResidentCourse.create!(resident_id: @abe.id, course_id: @surfing.id)
      ResidentCourse.create!(resident_id: @jordan.id, course_id: @surfing.id)
      ResidentCourse.create!(resident_id: @jordan.id, course_id: @skydiving.id)
      ResidentCourse.create!(resident_id: @abe.id, course_id: @eating.id)

      expect(@surfing.count_courses).to eq(4)
      expect(@skydiving.count_courses).to eq(2)
    end
  end
  

end
