require 'rails_helper' 

# As a visitor,
# When I visit '/residents/:id'
# I see this resident's name
# And I see a list of this resident's courses.

# (e.g. "Jessica Fletcher
#       Courses:
#             - Crime Scenes 101"
#             - Fingerprinting")


RSpec.describe 'Resident' do 
  before :each do 
    @hady = Resident.create!(name: "Hady", age: 45, occupation: "lawyer")
    @skydiving = Course.create!(name: "Skydiving")
    @eating = Course.create!(name: "Eating")
    @malena = Resident.create!(name: "Malena", age: 23, occupation: "tour guide")
    @surfing = Course.create!(name: "Surfing")

    ResidentCourse.create!(resident_id: @hady.id, course_id: @skydiving.id)
    ResidentCourse.create!(resident_id: @hady.id, course_id: @surfing.id)
    ResidentCourse.create!(resident_id: @malena.id, course_id: @surfing.id)

  end

  it "shows the lists of the resident's courses" do 

    visit "/residents/#{@hady.id}"

    expect(page).to have_content(@hady.name)
    expect(page).to have_content(@skydiving.name)
    expect(page).to have_content(@surfing.name)

  end 
end 
