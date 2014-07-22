class CreateRemedies < ActiveRecord::Migration
  def change
    create_table :remedies do |t|
      t.string :quantidade
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
