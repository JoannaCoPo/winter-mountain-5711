require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end

  describe "instance methods" do
    before :each do
      @hospital_1 = Hospital.create!(name: "Boulder Community Health")

      @doctor_1 = @hospital_1.doctors.create!(name: "Ima Doctor", specialty: "Cardiology", university: "Great University")
      @doctor_2 = @hospital_1.doctors.create!(name: "Otro Doctor", specialty: "ER", university: "Great University")
      @doctor_3 = @hospital_1.doctors.create!(name: "Some Doctor", specialty: "Pediatrics", university: "Ivy University")
      @doctor_4 = @hospital_1.doctors.create!(name: "Doctor Person", specialty: "OBGYN", university: "International University")
    end

    it "can indicate the number of doctors that work at a hospital" do
      expect(Doctor.doctor_count).to eq(4)
    end

    it "can return unique list of universities that a hospital's doctors attended" do
      expect(Doctor.doctor_universities).to eq("Great University, Ivy University, International University")
    end
  end
end
