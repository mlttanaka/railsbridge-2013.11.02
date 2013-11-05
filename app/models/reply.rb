class Reply < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :post
  belongs_to :user
end
