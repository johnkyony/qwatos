
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
    where(provider: auth.provider , uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_toke[0,20]
      user.name = auth.info.name
      user.name = auth.info.image
    end
      
    end  
end
 