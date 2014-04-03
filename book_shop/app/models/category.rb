#enconding: UTF-8
class Category < ActiveRecord::Base

  # Callbacks
  before_validation :set_downcase_key

  # Asociaciones
  has_many :products

  # Validaciones
  validates :name, :key, presence: true
  validates_with LikeValidator
  validates :key, uniqueness: true
  validates :key, format: {
    with: /\A[a-z]+\z/, message: "tiene que estar en minúsculas"
  }

private

  def set_downcase_key
    unless key.blank?
      self.key = key.sub(" ","").downcase
    end
  end
end
