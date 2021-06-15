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

    expect(page).to have_content(4)
  end

  it 'displays a unique list of universities that this hospitals doctors attended' do

    expect(page).to have_content(@doctor_1.university, count:1)
    expect(page).to have_content(@doctor_2.university)
    expect(page).to have_content(@doctor_3.university)
    expect(page).to have_content(@doctor_4.university)
  end
end
