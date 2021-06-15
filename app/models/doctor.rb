class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  # new method in Hospital
  # def self.doctor_count
  #   all.count
  # end

  def self.doctor_universities
    # collection = pluck(:university).uniq           # original version
    collection = distinct.pluck(:university)         # new version
    # collection = pluck('DISTINCT university')      # also an option with SQL
    collection.join(', ')
  end

  # def self.doctor_universities                    # option using select
  #   collection = select('distinct university').map(&:university)
  #   collection.join(', ')
  # end
end
