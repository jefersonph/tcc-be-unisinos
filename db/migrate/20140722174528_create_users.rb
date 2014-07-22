class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :sangue
      t.string :peso
      t.string :altura
      t.string :pressao

      t.timestamps
    end
  end
end
