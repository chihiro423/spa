class Like < ApplicationRecord
  belongs_to :hotspring
  belongs_to :user
  validates_uniqueness_of :hotspring_id, scope: :user_id
end
