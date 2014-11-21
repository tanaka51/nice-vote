class AnswerItem < ActiveRecord::Base
  belongs_to :answer
  belongs_to :vote_item
end
