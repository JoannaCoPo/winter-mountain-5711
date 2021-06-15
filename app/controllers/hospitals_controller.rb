class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @count = @hospital.doctor_count
    @doctor_universities = @hospital.doctors.doctor_universities
  end
end
