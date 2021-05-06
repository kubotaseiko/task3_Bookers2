class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :comment, presence: true
  
  def following?(other_user)
   following.include?(other_user)
  end
  
end
