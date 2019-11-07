class CreateSetLists < ActiveRecord::Migration[5.1]
  def change
    create_table :set_lists do |t|
      t.string :title
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
