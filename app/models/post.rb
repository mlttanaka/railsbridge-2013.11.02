class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user
  has_many :replies
end
