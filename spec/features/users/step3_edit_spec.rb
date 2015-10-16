require "rails_helper"

feature 'Create/Edit - Step 3' do

	let (:user_client) {create(:user, :incomplete_register)}

	background do
		create_list(:investment_question, 3)
		create_list(:investment_answer, 3, :investment_question_id => 1)
		create_list(:investment_answer, 3, :investment_question_id => 2)
		create_list(:investment_answer, 3, :investment_question_id => 3)

		login(user_client.email, user_client.password)
	  visit user_step_path(user_client, 3)
	  sleep 20
	end

	scenario 'success - next', js: true do

		# check 'user_objective_ids_1'
		# check 'user_objective_ids_3'

		click_button "Salvar e ir para o próximo"
		sleep 1
		expect(page).to have_content "Salvo com sucesso"
		sleep 1
		expect(current_path).to eql(user_step_path(user_client, 4))

	end

	# scenario 'success - back', js: true do


	# 	click_link "Anterior"
	# 	sleep 1
	# 	expect(current_path).to eql(user_step_path(user_client, 2))

	# end

end
