class User < ActiveRecord::Base
  extend Rolify
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :region
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids,:first_name,:surname,:region,:sex
  # attr_accessible :title, :body

  def to_s
    self.email
  end

  def name
    self.email
  end

end
