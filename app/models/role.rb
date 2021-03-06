class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  extend Rolify

  attr_accessible :name,:user_ids
  scopify
end
