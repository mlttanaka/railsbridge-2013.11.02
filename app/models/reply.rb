class Reply < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 20 }
  belongs_to :post
  belongs_to :user
end
