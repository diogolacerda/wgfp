require "rails_helper"

feature 'Create/Edit - Step 2' do

	let (:user_client) {create(:user, :incomplete_register)}
	let (:user_admin) {create(:user, :admin)}

	background do
		create_list(:objective, 3)

		login(user_admin.email, user_admin.password)
	  visit user_step_path(user_client, 2)
	  sleep 1
	end

	scenario 'success', js: true do

		check 'user_objective_ids_1'
		check 'user_objective_ids_3'

		click_button "Salvar e ir para o próximo"
		sleep 1
		expect(page).to have_content "Salvo com sucesso"
		sleep 1
		expect(current_path).to eql(user_step_path(user_client, 3))

	end

end