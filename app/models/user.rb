class User < ActiveRecord::Base
  extend Rolify
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :region
  has_many :case_details
  has_many :appeals, :foreign_key => :prosecutor_id
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids,:first_name,:surname,:region_id,:sex,:title
  # attr_accessible :title, :body

  def to_s
    name
  end

  def name
    "#{title} - #{surname}, #{first_name}"
  end


  def self.ransackable_attributes(auth_object = nil)
          super & %w"first_name surname sex email title"
      end
end
