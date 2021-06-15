require 'rails_helper'

RSpec.describe 'Hospital show page,' do
  before :each do
    @hospital_1 = Hospital.create!(name: "Boulder Community Health")

    @doctor_1 = @hospital_1.doctors.create!(name: "Ima Doctor", specialty: "Cardiology", university: "Great University")
    @doctor_2 = @hospital_1.doctors.create!(name: "Otro Doctor", specialty: "ER", university: "Great University")
    @doctor_3 = @hospital_1.doctors.create!(name: "Some Doctor", specialty: "Pediatrics", university: "Ivy University")
    @doctor_4 = @hospital_1.doctors.create!(name: "Doctor Person", specialty: "OBGYN", university: "International University")

    visit hospital_path(@hospital_1)
  end

  it 'displays number of doctors employed at hospital' do

    # expect(@hospital_1.doctor_count).to eq(4) #com back to this expectation if time
    expect(page).to have_content(4)
  end
end

# User Story 2, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
