class CreateGraduations < ActiveRecord::Migration
  def change
    create_table :graduations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
