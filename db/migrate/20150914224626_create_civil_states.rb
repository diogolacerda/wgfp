class CreateCivilStates < ActiveRecord::Migration
  def change
    create_table :civil_states do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
