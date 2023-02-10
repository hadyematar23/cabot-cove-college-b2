require 'rails_helper' 

# As a visitor,
# When I visit '/residents',
# I see a list of residents with the following information:
# - Name
# - Age
# - Occupation
# (e.g. "Name: Jessica Fletcher, Age: 65, Occupation: Mystery writer", 
#       "Name: Dr. Seth Hazlitt, Age: 70, Occupation: Town Doctor")



RSpec.describe 'Resident' do 
  before :each do 
    @hady = Resident.create(name: "Hady", age: 45, occupation: "lawyer")
    @abe = Resident.create(name: "Abe", age: 33, occupation: "doctor")
    @malena = Resident.create(name: "Malena", age: 26, occupation: "tour guide")
  end 

  it "shows all the attributes of the residents" do 
    
    visit '/residents'

    expect(page).to have_content(@hady.name)
    expect(page).to have_content(@hady.age)
    expect(page).to have_content(@hady.occupation)

    expect(page).to have_content(@abe.name)
    expect(page).to have_content(@abe.age)
    expect(page).to have_content(@abe.occupation)

    expect(page).to have_content(@malena.name)
    expect(page).to have_content(@malena.age)
    expect(page).to have_content(@malena.occupation)


  end

  it "shows the average age of all the residents" do 

    visit '/residents'

    expect(page).to have_content("Average Age")
    expect(page).to have_content("34.67")

  end

  it "shows the residents in alphabetical order" do 

    visit '/residents'
    save_and_open_page
    expect(page).to have_content("Abe")
    expect(page).to have_content("Hady")
    expect(page).to have_content("Malena")

    expect("Abe").to appear_before("Hady")
    expect("Hady").to appear_before("Malena")

  end
end