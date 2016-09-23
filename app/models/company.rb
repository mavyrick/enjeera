class Company < ApplicationRecord

  belongs_to :user

  has_many :applyings, dependent: :destroy
  has_many :applicants, through: :applyings, source: :user

  def applying_for(user)
    applyings.find_by_user_id(user)
  end

end
