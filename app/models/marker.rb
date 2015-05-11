class Marker < ActiveRecord::Base
  belongs_to :map

  validates :title, presence: { message: 'Заполните поле.' }
  validates :latitude, :longitude,
            format: { with: /\A-?\d{1,10}\.\d{1,6}\z/i,
                      message: 'Неверный формат.'},
            presence: { message: 'Заполните поле.' }
end
