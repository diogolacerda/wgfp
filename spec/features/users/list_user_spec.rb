require "rails_helper"

feature 'User - list' do


		scenario 'redirect to login when not logged' do
		  visit users_path
		  expect(current_path).to eql(new_session_path) 
		end



		scenario "State Filter", js:true do

			state1 = create(:state)
			state2 = create(:state)

			user1 = create(:user, :state => state1)
			user2 = create(:user, :state => state1)
			user3 = create(:user, :state => state2)

			#create_list(:user, 4, :state_id => 13)
			user = create(:user, :profile_id => 1)
	    login(user.email, user.password)
	    sleep 10
	    visit users_path


	    select state1.name, from: "users_grid[state_id]"
			click_button "Filtrar"

			within("table.users_grid") do
		  	expect(page).to have_content user1.name
		  	expect(page).to have_content user2.name
		  	expect(page).not_to have_content user3.name
		  end

		end

	context 'Administrator' do
		scenario "success" , js:true do

			user = create(:user, :profile_id => 1)
	    login(user.email, user.password)
	    sleep 1
	    visit users_path

	    within("table.users_grid") do
	     expect(page).to have_content "Nome Completo"
	     expect(page).to have_content "Email"
	     expect(page).to have_content "Telefone"
	     expect(page).to have_content "Celular"
	     expect(page).to have_content "Estado"
	     expect(page).to have_content "Cidade"
	     expect(page).to have_content "Consultor"
	     expect(page).to have_content "Status"
	     expect(page).to have_link "Editar"
	     expect(page).to have_link "Excluir"
	   end 
 		end
	end

	context 'Consultant' do
		scenario "success" , js:true do

			user = create(:user, :profile_id => 2)
	    login(user.email, user.password)
	    sleep 1
	    visit users_path

	    within("table.users_grid") do
	     expect(page).to have_content "Nome Completo"
	     expect(page).to have_content "Email"
	     expect(page).to have_content "Telefone"
	     expect(page).to have_content "Celular"
	     expect(page).to have_content "Estado"
	     expect(page).to have_content "Cidade"
	     expect(page).to have_link "Editar"
	   end 
 		end
	end

end