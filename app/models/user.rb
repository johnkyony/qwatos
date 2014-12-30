
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable, :omniauth_providers => [:facebook]
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?


  

  has_many :likes
  has_many :dislikes
  has_one :facebook_oath_setting



  def set_default_role
    self.role ||= :user
  end
  def liked_before?(qwato)
    likes.any? {|like| like.qwato == qwato }
  end

  def disliked_before?(qwato)
    dislikes.any? {|dislike| dislike.qwato == qwato}
  end
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
  class User < ActiveRecord::Base
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
end
 