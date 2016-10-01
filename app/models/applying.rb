class Applying < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :application_questions, dependent: :destroy
end
