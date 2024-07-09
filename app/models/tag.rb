class Tag < ApplicationRecord
    has_many :hotspring_tag_relations, dependent: :destroy
    has_many :hotsprings, through: :hotspring_tag_relations, dependent: :destroy
end
