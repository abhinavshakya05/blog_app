class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:default, :author, :admin]
  enum status: [:active, :inactive, :blocked]

  after_initialize :set_default_role_and_status, :if => :new_record?

  has_many :articles

  def set_default_role_and_status
    self.role ||= :default
    self.status ||= :active
  end
end
