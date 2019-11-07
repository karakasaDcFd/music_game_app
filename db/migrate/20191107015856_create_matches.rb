class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.float :restriction_level
      t.datetime :date
      t.string :place

      t.timestamps
    end
  end
end
