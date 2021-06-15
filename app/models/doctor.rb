class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors
  #
  def self.doctor_count
    all.count
  end

  def self.doctor_universities
    collection = pluck(:university).uniq
    collection.join(', ')
  end
end
