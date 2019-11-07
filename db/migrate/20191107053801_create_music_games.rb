class CreateMusicGames < ActiveRecord::Migration[5.1]
  def change
    create_table :music_games do |t|
      t.string :name

      t.timestamps
    end
  end
end
