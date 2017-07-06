class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
   has_many :leaves 
   #newly added
   has_many :user_leaves 
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, ImageUploader

  after_create :send_admin_mail
  def send_admin_mail
  	LeaveMailer.approve_user(self).deliver

  	
  end

end
