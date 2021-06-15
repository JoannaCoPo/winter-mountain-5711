class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctor_count = @hospital.doctors.doctor_count
    @doctor_universities = @hospital.doctors.doctor_universities
  end
end
