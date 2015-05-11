class Map < ActiveRecord::Base
  has_many :markers, dependent: :destroy
  accepts_nested_attributes_for :markers,  reject_if: :all_blank, allow_destroy: true

  validates :title, presence: { message: 'Заполните поле.' }
end
