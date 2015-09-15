class CreateInvestmentAnswersUsers < ActiveRecord::Migration
  def change
    create_table :investment_answers_users do |t|
      t.references :investment_answer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
