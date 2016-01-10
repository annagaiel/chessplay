class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :player, index: true, foreign_key: true
      t.integer :days_per_turn
      t.string :play_as
      t.string :rated

      t.timestamps null: false
    end
  end
end
