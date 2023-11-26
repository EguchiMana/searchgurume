class GurumeTagRelation < ApplicationRecord
  belongs_to :gurume
  belongs_to :tag
end
