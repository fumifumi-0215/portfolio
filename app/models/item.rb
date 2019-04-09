class Item < ApplicationRecord
  belongs_to :user
   validates :user_id, presence: true
     default_scope -> { order(created_at: :desc) }
    validates :description, presence: true, length: { maximum: 140 }
end
