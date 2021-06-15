class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors
    .distinct
    .count
  end
end
