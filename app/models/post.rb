class Post < ApplicationRecord
  belongs_to :user
  validates :post, presence: true


  def as_json(options={})
    super.merge(
      created_at: self.created_at.strftime("%B %e %Y @ %l:%M %p")
    )
  end

  def avatar_url
    user.avatar.url(:thumb)
  end
end
