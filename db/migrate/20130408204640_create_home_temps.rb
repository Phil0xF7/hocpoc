class CreateHomeTemps < ActiveRecord::Migration
  def change
    create_table :home_temps do |t|
      t.decimal :temp, :precision => 5, :scale => 2
      t.decimal :humidity, :precision => 5, :scale => 2

      t.timestamps
    end
  end
end
