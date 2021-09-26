class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, length: { maximum: 30 }, presence: true
  validate :validate_name_not_including_commma

  private
  
    def validate_name_not_including_commma
      errors.add(:name, 'にカンマを含めることはできません。') if name&.include?(',')
    end

    def set_nameless_name
      self.name = '名前なし', if name.blank?
    end
end
