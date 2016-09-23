class CompanyUser < ApplicationRecord

  has_secure_password

  # has_one :company

  validates :company_name, presence: true
  validates :company_name, uniqueness: true

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true,
           format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}"
  end

end
