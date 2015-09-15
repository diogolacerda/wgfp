class CreateInvestmentAnswers < ActiveRecord::Migration
  def change
    create_table :investment_answers do |t|
      t.string :answer
      t.references :investment_question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
