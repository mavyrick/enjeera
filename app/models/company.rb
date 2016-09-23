class Company < ApplicationRecord

  belongs_to :user

  has_many :applyings, dependent: :destroy
  has_many :applicants, through: :applyings, source: :user

end
