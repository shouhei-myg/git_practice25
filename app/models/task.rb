class Task < ApplicationRecord
  validates :title,
    presence: true

  validates :title,
    length: { minimum: 3, maximum: 10 }

  validates :content,
    presence: true

  validates :content,
    length: { minimum: 3, maximum: 10 }
end
