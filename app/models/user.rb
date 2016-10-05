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

  def self.setup(user_params, other_params)
    new_user = create(user_params)
    case other_params[:company_admin]
    when "User"
      return new_user
    when "Company"
      Company.create(title: other_params[:company_name], description: other_params[:company_description], user: new_user)
      new_user.update(company_admin: true)
      return new_user
    end
    # new_user
  end

end
