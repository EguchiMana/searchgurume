class Tag < ApplicationRecord
    has_many :gurume_tag_relations, dependent: :destroy
  has_many :gurumes, through: :gurume_tag_relations, dependent: :destroy
end
