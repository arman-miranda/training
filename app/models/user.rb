class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { thumb: "200x200<" },
      default_url: "/images/:style/missing.png"

  belongs_to :department


  validates :username, :department_id, presence: true
  validates :username, :email, uniqueness:true
  validates_attachment :avatar, presence: true,
      content_type: { content_type: /\Aimage\/.*\z/ },
      size: { in: 0..2048.kilobytes}


  def email_required?
    false
  end

  def email_changed?
    false
  end

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name])
  end
end
