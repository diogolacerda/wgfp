require "rails_helper"

feature 'User - list' do

	context 'Administrator' do
		scenario "success" , js:true do

			adm = create(:user, :profile_id => 1)
	    login(adm.email, adm.password)
	    visit users_path

	    within("table.admin_proposals_grid") do
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

end