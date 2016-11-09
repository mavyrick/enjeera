class ApplicationQuestion < ApplicationRecord
  belongs_to :company
  # belongs_to :applying
  has_many :application_answers
end
