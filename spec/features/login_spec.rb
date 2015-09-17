
require "rails_helper"


feature "Login" do

	context 'Administrador' do
    scenario "success" , js:true do
      adm = create(:user, :profile_id => 1)
      login(adm.email, adm.password)
      expect(page).to have_content "Bem-vindo!"
      expect(current_path).to eq user_index_path
    end

    # scenario 'does not see Proposta link and sees Propostas and Usuários link' do
    #   adm = create(:user, :user_type_id => 1)
    #   login(adm.email, adm.password)
    #   expect(page).to  have_link 'Propostas'
    #   expect(page).to  have_link 'Usuários'
    # end
  end

	scenario 'invalid', js: true do
	  login('bbbb@bbb.bbb', 'aaaaaaa')
	  expect(page).to have_content 'Usuário não encontrado'
	end

end	
