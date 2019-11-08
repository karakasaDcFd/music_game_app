class CreateBanLists < ActiveRecord::Migration[5.1]
  def change
    create_table :ban_lists do |t|
      t.string :title
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
