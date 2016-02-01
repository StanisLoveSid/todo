class Post < ActiveRecord::Base
	searchkick
	belongs_to :user
	acts_as_votable
    has_many   :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5 }
	validates :body, presence: true

end
