class Comment < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :note, presence: true
end
