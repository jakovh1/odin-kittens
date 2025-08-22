class CreateKittens < ActiveRecord::Migration[8.0]
  def change
    create_table :kittens do |t|
      t.string :name, null: false
      t.decimal :age, precision: 3, scale: 1
      t.string :cuteness
      t.string :softness

      t.timestamps
    end
  end
end
