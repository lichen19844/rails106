class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :username, presence: true, length: { maximum: 25 }

  has_many :identifies

  has_many :groups
  has_many :posts

  def self.from_google(access_token, signed_in_resource=nil)
  	data = access_token.info
  	identify = Identify.find_by(:provider => access_token.provider, :uid => access_token.uid)

  	if identify
  		return identify.user
  	else
  		user = User.find_by(:email => access_token.email)
  		if !user
  			user = User.create(
  				username: data["name"],
  				email: data["email"],
  				image: data["image"],
  				password: Devise.friendly_token[0,20]
  			)
  		end
			identify = Identify.create(
				provider: access_token.provider,
				uid: access_token.uid,
				user: user
			)
		  return user
  	end
  end

  def self.from_facebook(access_token, signed_in_resource=nil)
    data = access_token.info
    identify = Identify.find_by(:provider => access_token.provider, :uid => access_token.uid)

    if identify
      return identify.user
    else
      user = User.find_by(:email => data.email)
      if !user
        user = User.create(
          username: access_token.extra.raw_info.name,
          email: data.email,
          image: data.image,
          password: Devise.friendly_token[0,20]
        )
      end
      identify = Identify.create(
        provider: access_token.provider,
        uid: access_token.uid,
        user: user
      )
      return user
    end
  end

end
