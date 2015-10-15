require "rails_helper"

feature 'Create/Edit - Step 2' do

	let (:user_client) {create(:user, :incomplete_register)}

	background do
		create_list(:objective, 3)

		login(user_client.email, user_client.password)
	  visit user_step_path(user_client, 2)
	  sleep 1
	end

	scenario 'success - next', js: true do

		check 'user_objective_ids_1'
		check 'user_objective_ids_3'

		click_button "Salvar e ir para o próximo"
		sleep 1
		expect(page).to have_content "Salvo com sucesso"
		sleep 1
		expect(current_path).to eql(user_step_path(user_client, 3))

	end

	scenario 'success - back', js: true do


		click_link "Anterior"
		sleep 1
		expect(current_path).to eql(user_step_path(user_client, 1))

	end

end