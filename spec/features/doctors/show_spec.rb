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

  it 'has link to remove patient from doctor without destroying patient record' do
    within("#patient-details-#{@patient_1.id}") do
      expect(page).to have_button("Remove #{@patient_1.name}")
      click_button "Remove #{@patient_1.name}"
      save_and_open_page
    end

    expect(page).to_not have_content(@patient_1.name)
    expect(current_path).to eq(doctor_path(@doctor_1))
  end
end


# User Story 3, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed
#
# NOTE: the patient record should not be deleted entirely
