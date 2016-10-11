class Applying < ApplicationRecord
  belongs_to :user
  belongs_to :company

  has_many :application_answers, dependent: :destroy
  has_many :application_questions, through: :application_answers

  accepts_nested_attributes_for :application_answers, allow_destroy: true

  has_many :accepted_applications, dependent: :destroy
  has_many :users, through: :accepted_applications

  def accepted_application_for(user)
    accepted_applications.find_by_user_id(user)
  end

end
