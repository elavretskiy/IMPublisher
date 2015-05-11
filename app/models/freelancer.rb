class Freelancer < ActiveRecord::Base
  validates :name, presence:  { message: 'Заполните поле.' }
  validates :email, presence:  { message: 'Заполните поле.' },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,
                      message: 'Неверный формат.'}
end
