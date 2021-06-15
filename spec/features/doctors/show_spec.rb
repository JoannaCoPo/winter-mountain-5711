require 'rails_helper'

RSpec.describe 'Doctors show page,' do
  before :each do
    @hospital_1 = Hospital.create!(name: "Boulder Community Health")

    @doctor_1 = @hospital_1.doctors.create!(name: "Ima Doctor", specialty: "Cardiology", university: "Great University")

    @patient_1 = Patient.create!(name: "Oscar Cortes", age: 40)
    @patient_2 = Patient.create!(name: "Kyla Benson", age: 32)
    @patient_3 = Patient.create!(name: "George Smith", age: 60)

    PatientDoctor.create!(patient: @patient_1, doctor: @doctor_1)
    PatientDoctor.create!(patient: @patient_2, doctor: @doctor_1)
    PatientDoctor.create!(patient: @patient_3, doctor: @doctor_1)

    visit doctor_path(@doctor_1)
  end

  it 'displays doctor attributes' do

    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)
  end

  it 'displays hospital where meployed and their patients' do

    expect(page).to have_content(@hospital_1.name)
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_3.name)
  end
end
