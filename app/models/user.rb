class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :department

  validates :username, :department_id, presence: true
  validates :username, :email, uniqueness:true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
