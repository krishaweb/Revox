class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  
  
  validates :fname, presence: {:message => "Please enter your first name"}
  validates :lname, presence: {:message => "Please enter your last name"}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :email, uniqueness: {:message => "This email is already used"}, on: :create
  # validates :image, presence: {:message => "Please select image"}

  def full_name
    fullname = "#{lname}, #{fname}"
  end
  
end