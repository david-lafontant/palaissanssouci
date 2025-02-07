class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable

  validates :first_name, :last_name, :role, presence: true
  validates :first_name, :last_name, length: { in: 2..40 }
  enum :role, [:visitor, :member, :admin, :sysadmin].freeze, default: :visitor, validate: true


  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :seller
  end

end