class PatientDoctorsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    patient_doctor = PatientDoctor.find_by(doctor: doctor, patient: patient)
    patient_doctor.destroy

    redirect_to doctor_path(doctor)
  end
end
