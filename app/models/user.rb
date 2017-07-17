class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { thumb: "200x200>" },
      default_url: "/images/:style/missing.png"

  belongs_to :department
  has_many :posts, dependent: :destroy


  validates :first_name, :last_name,
      :email, :department_id, presence: true
  validates :username, format: { without: /\s/ ,
      message: "shouldn't have white spaces"}
  validates :username, :email, uniqueness:true, allow_blank: true
  validates_attachment :avatar,
      content_type: { content_type: /\Aimage\/.*\z/ },
      size: { in: 0..2048.kilobytes}
  validates :username, :email, length: {maximum: 191}


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
