class ApplicationAnswer < ApplicationRecord
  belongs_to :application_question
  belongs_to :applying
end
