
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
end
 