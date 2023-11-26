class Gurume < ApplicationRecord

    mount_uploader :image, ImageUploader
    has_many :gurume_tag_relations, dependent: :destroy
    has_many :tags, through: :gurume_tag_relations, dependent: :destroy

    belongs_to :user

end
