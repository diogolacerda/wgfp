class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :activation_token
      t.string :recovery_token
      t.string :phone
      t.string :celphone
      t.boolean :is_blocked
      t.integer :consultant_id
      t.references :state, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.string :email_secondary
      t.string :cpf
      t.string :rg
      t.string :issuer
      t.date :birthday
      t.references :civil_state, index: true, foreign_key: true
      t.references :nationality, index: true, foreign_key: true
      t.string :profession
      t.string :zip_code
      t.string :street
      t.string :complement
      t.string :district
      t.references :graduation, index: true, foreign_key: true
      t.string :father
      t.string :mother
      t.string :wife
      t.string :wife_cpf
      t.date :wife_birthday
      t.string :company
      t.string :cnpj
      t.string :company_zip_code
      t.integer :company_city_id
      t.string :company_street
      t.string :company_district

      t.timestamps null: false
    end
  end
end
