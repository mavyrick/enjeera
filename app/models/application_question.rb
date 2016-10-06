class ApplicationQuestion < ApplicationRecord
  belongs_to :company
  has_many :application_answers

end
