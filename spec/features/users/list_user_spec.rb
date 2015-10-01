require "rails_helper"

feature 'User - list' do


		scenario 'redirect to login when not logged' do
		  visit admin_users_path
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
	    sleep 1
	    visit admin_users_path


	    select state1.name, from: "users_grid[state_id]"
			click_button "Filtrar"

			within("table.users_grid") do
		  	expect(page).to have_content user1.name
		  	expect(page).to have_content user2.name
		  	expect(page).not_to have_content user3.name
		  end

		end

		scenario "Name Filter", js:true do

			name1 = Faker::Name.name

			user1 = create(:user, :name => name1)
			user2 = create(:user, :name => Faker::Name.name)

			user = create(:user, :profile_id => 1)
	    login(user.email, user.password)
	    sleep 10
	    visit admin_users_path


	    fill_in "users_grid[name]", with: name1
			click_button "Filtrar"
			
			within("table.users_grid") do
		  	expect(page).to have_content user1.name
		  	expect(page).not_to have_content user2.name
		  end

		end

	context 'Administrator' do
		scenario "success user list" , js:true do

			user = create(:user, :profile_id => 1)
	    login(user.email, user.password)
	    sleep 1
	    visit admin_users_path

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

 		scenario "Consultant Filter", js:true do

			consult1 = create(:user, :profile_id => 2)
			consult2 = create(:user, :profile_id => 2)

			user1 = create(:user, :profile_id => 3, :consultant => consult1)
			user2 = create(:user, :profile_id => 3, :consultant => consult1)
			user3 = create(:user, :profile_id => 3, :consultant => consult2)

			user = create(:user, :profile_id => 1)
	    login(user.email, user.password)
	    sleep 10
	    visit admin_users_path

	    select consult1.name, from: "users_grid[consultant_id]"
			click_button "Filtrar"
			sleep 10

			within("table.users_grid") do
		  	expect(page).to have_content user1.name
		  	expect(page).to have_content user2.name
		  	expect(page).not_to have_content user3.name
		  end
		end


	end

	context 'Consultant' do
		scenario "success user list" , js:true do

			user = create(:user, :profile_id => 2)
	    login(user.email, user.password)
	    sleep 1
	    visit admin_users_path

	    within("table.users_grid") do
	     expect(page).to have_content "Nome Completo"
	     expect(page).to have_content "Email"
	     expect(page).to have_content "Telefone"
	     expect(page).to have_content "Celular"
	     expect(page).to have_content "Estado"
	     expect(page).to have_content "Cidade"
	     expect(page).to have_link "Editar"
	   end 

	   expect(page).not_to have_content "Consultor"

 		end
	end

end