class Answer < ActiveRecord::Base
  has_many :items, class_name: 'AnswerItem'

  belongs_to :vote

  validates :user_name, presence: true

  accepts_nested_attributes_for :items
end
