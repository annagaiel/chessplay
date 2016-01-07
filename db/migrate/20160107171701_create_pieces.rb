class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :x_position
      t.integer :y_position
      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.boolean :captured
      t.string :color

      t.timestamps null: false
    end
  end
end
