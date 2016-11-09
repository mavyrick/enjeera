class Company < ApplicationRecord
  mount_uploader :picture, AvatarUploader

  belongs_to :user

  has_many :applyings, dependent: :destroy
  has_many :applicants, through: :applyings, source: :user
  has_many :application_questions
  accepts_nested_attributes_for :application_questions, allow_destroy: true

  has_many :accepted_applications, dependent: :destroy
  has_many :users, through: :accepted_applications

  def applying_for(user)
    applyings.find_by_user_id(user)
  end

  geocoded_by :address
  after_validation :geocode

  # accepts_nested_attributes_for(:application_questions)
end
