class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.datetime :date
      t.string :category
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
