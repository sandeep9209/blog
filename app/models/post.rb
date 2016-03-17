class Post < ActiveRecord::Base
    belongs_to :user

	validates :appointment, presence: true, length: {minimum: 5}
	validates :about,  presence: true
    validates :time,  presence: true

end
