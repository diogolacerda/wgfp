require "rails_helper"

feature 'Edit Client' do


	scenario "success", js:true do	

		user_client1 = create(:user, :complete_register)
		user_client2 = create(:user, :complete_register)

		adm = create(:user, :admin)
	  login(adm.email, adm.password)
	  #visit admin_users_path	
	  sleep 1

	  #click_link "Editar"
	  within("table.users_grid") do
	  	page.click_link('', :href => user_step_path(user_client1, 1))
	  end
	  sleep 1
	  expect(current_path).to eql(user_step_path(user_client1, 1)) 


	end

end