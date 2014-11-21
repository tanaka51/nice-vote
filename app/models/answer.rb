class Answer < ActiveRecord::Base
  belongs_to :vote

  validates :user_name, presence: true
end
