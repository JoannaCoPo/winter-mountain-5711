class Hospital < ApplicationRecord
  has_many :doctors
end

# def doctor_count
#   Doctor.all.count
# end
