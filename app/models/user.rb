class User < ActiveRecord::Base

  has_secure_password

  mount_uploader :picture, AvatarUploader

  has_one :company

  has_many :applyings, dependent: :destroy
  has_many :companies_applied_to, through: :applyings, source: :company

  validates :password, presence: true, unless: :from_oauth?

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true,
            # unless: from_oauth?,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

serialize :linkedin_data, Hash

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

  def from_oauth?
    uid.present? && provider.present?
  end

   def self.find_or_create_from_linkedin(linkedin_data)
     find_by_linkedin(linkedin_data) || create_from_linkedin(linkedin_data)
   end

   def self.find_by_linkedin(linkedin_data)
     find_by(uid:linkedin_data["uid"], provider: linkedin_data["provider"])
   end

   serialize :linkedin_data, Hash

   def self.create_from_linkedin(linkedin_data)
     full_name = linkedin_data["info"]["name"].split
     user      = User.create!(first_name: full_name[0],
                last_name: full_name[1],
                uid: linkedin_data[:uid],
                email: linkedin_data[:info][:email],
                image: linkedin_data[:info][:image],
                location: linkedin_data["info"]["location"],
                password: "super7",
                provider: linkedin_data[:provider])
     #user_profile = UserProfile.create!(user: user....)
     user
   end
end
