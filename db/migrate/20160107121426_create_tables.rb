class CreateTables < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :white_player
      t.integer :black_player

      t.timestamps null: false
    end

    create_table(:players) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :fullname

      t.timestamps null: false
    end

    add_index :players, :email,                unique: true
    add_index :players, :reset_password_token, unique: true
    # add_index :players, :confirmation_token,   unique: true
    # add_index :players, :unlock_token,         unique: true

    create_table :pieces do |t|
      t.integer :x_position
      t.integer :y_position
      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.boolean :captured
      t.string :color
    end

    create_table :offers do |t|
      t.references :player, index: true, foreign_key: true
      t.integer :days_per_turn
      t.string :play_as
      t.string :rated

      t.timestamps null: false
    end
  end
end
