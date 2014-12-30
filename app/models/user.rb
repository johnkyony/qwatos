
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
  provider = auth.provider
  uid = auth.uid  
  user = User.find_or_initialize_by(uid: uid , provider: provider)
  user.email = auth.info.email
  user.name = auth.info.name
  user.password = Devise.friendly_token[0,20]
  user.image = auth.info.image
  user.save!
  user
  
end


end
 