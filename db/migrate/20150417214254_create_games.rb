class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :win_home
      t.string :draw
      t.string :win_away

      t.timestamps null: false
    end
  end
end
