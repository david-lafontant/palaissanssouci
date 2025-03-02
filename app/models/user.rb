class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable

  validates :first_name, :last_name, :role, presence: true
  validates :first_name, :last_name, length: { in: 2..40 }
  enum :role, %i[admin sysadmin].freeze, default: :admin, validate: true

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :admin
  end
end
