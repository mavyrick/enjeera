class User < ActiveRecord::Base

  has_secure_password

  has_one :company

  has_many :applyings, dependent: :destroy
  has_many :companies_applied_to, through: :applyings, source: :company

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}"
  end

end
