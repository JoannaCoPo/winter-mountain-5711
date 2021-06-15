class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors
  #
  def self.doctor_count
    all.count
  end
end
