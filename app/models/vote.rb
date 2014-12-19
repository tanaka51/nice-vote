class Vote < ActiveRecord::Base
  has_many :answers
  has_many :items, class_name: 'VoteItem'

  validates :title,    presence: true
  validates :password, presence: true
  validates :uuid,     presence: true, uniqueness: true

  before_validation :set_uuid, unless: :uuid
  before_validation :skip_update_password, on: :update, if: -> { password.blank? }

  accepts_nested_attributes_for :items, reject_if: -> (attr) { attr[:name].blank? }

  def to_param
    uuid
  end

  private

  def set_uuid
    uuid = SecureRandom.uuid
    while self.class.where(uuid: uuid).exists?
      uuid = SecureRandom.uuid
    end
    self.uuid = uuid
  end

  def skip_update_password
    self.password = password_was
  end
end
