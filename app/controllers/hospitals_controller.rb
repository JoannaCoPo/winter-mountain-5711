class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    # require "pry"; binding.pry
    @doctor_count = @hospital.doctors.doctor_count
  end
end
