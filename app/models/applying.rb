class Applying < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :application_answers, dependent: :destroy

  accepts_nested_attributes_for :application_answers, allow_destroy: true

end
