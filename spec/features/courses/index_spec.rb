

require 'rails_helper' 

RSpec.describe 'Courses' do
  before :each do 
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
  end 

    it "when the visitor visits courses, they see the number of residents enrolled in each course" do 
    
      visit "/courses"
save_and_open_page
      expect(page).to have_content("Skydiving: 2")
      expect(page).to have_content("Surfing: 4")
      expect(page).to have_content("Eating: 1")

  end
end
