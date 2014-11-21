class VoteItem < ActiveRecord::Base
  belongs_to :vote

  validates :name, presence: true
end
