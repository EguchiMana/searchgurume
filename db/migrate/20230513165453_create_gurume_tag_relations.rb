class CreateGurumeTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :gurume_tag_relations do |t|
      t.references :gurume, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
