class AcceptedApplication < ApplicationRecord
  belongs_to :applying
  belongs_to :user
  belongs_to :company
end
