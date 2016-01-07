class AddFullnameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :fullname, :string
  end
end
