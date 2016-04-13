class TodoItem < ActiveRecord::Base
  acts_as_list	
  belongs_to :post
  validates :content, presence: true, length: {minimum: 5 }
  validates :deadline, presence: true
  default_scope { order("priority ASC") }
  def completed?
  	!completed_at.blank?
  end
end