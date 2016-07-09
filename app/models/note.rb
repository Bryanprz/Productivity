class Note < ApplicationRecord
  validates :description, presence: true
end
