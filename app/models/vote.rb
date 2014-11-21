class Vote < ActiveRecord::Base
  validates :title,    presence: true
  validates :password, presence: true
  validates :uuid,     presence: true, uniqueness: true

  before_validation :set_uuid, unless: :uuid

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
end
