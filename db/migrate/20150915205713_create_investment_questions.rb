class CreateInvestmentQuestions < ActiveRecord::Migration
  def change
    create_table :investment_questions do |t|
      t.string :question

      t.timestamps null: false
    end
  end
end
