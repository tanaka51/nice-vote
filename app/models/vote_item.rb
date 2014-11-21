class VoteItem < ActiveRecord::Base
  belongs_to :vote

  validates :name, presence: true
  validates :vote, presence: true
end
