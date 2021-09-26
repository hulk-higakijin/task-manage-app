class Task < ApplicationRecord
  validates :name, presence: true
  validate :validate_name_not_including_commma
  belongs_to :user

  private
  
    def validate_name_not_including_commma
      errors.add(:name, 'にカンマを含めることはできません。') if name&.include?(',')
    end

    def set_nameless_name
      self.name = '名前なし' if name.blank?
    end
end
