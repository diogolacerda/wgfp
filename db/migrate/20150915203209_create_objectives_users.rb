class CreateObjectivesUsers < ActiveRecord::Migration
  def change
    create_table :objectives_users do |t|
      t.references :objective, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
