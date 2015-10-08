
require "rails_helper"


feature "Login" do

	context 'Administrator' do
    scenario "success" , js: true do
      adm = create(:user, :admin)
      login(adm.email, adm.password)
      expect(page).to have_content "Bem-vindo!"
      expect(page).not_to have_content "Ficha cadastro"
      sleep 1
      expect(current_path).to eq admin_users_path
    end

  end

  context 'Consultant' do
    scenario "success" , js: true do
      adm = create(:user, :consult)
      login(adm.email, adm.password)
      expect(page).to have_content "Bem-vindo!"
      expect(page).not_to have_content "Ficha cadastro"
      sleep 1
      expect(current_path).to eq admin_users_path
    end

  end


  context 'Client' do

    scenario "is blocked" , js: true do
    	blocked_user = create(:user, :blocked, :client)
    	login(blocked_user.email, blocked_user.password)
      sleep 1
    	expect(page).to have_content 'Usuário bloqueado'
    end

    scenario "is inactivated" , js: true do
    	inactivated_user = create(:user, :not_activated, :client)
    	login(inactivated_user.email, inactivated_user.password)
      sleep 1
    	expect(page).to have_content 'Usuário inativado'
    end

    scenario "incomplete register" , js: true do
    	user = create(:user, :incomplete_register, :client)
    	login(user.email, user.password)
    	expect(page).to have_content 'Bem-vindo!'
      sleep 1
    	expect(current_path).to eql(user_step_path(user, 1)) 
    end

    scenario "complete register" , js: true do
    	user = create(:user, :complete_register, :client)
    	login(user.email, user.password)
    	expect(page).to have_content 'Bem-vindo!'
      sleep 1
    	expect(current_path).to eq root_path
    end

  end


	scenario 'invalid', js: true do
	  login('bbbb@bbb.bbb', 'aaaaaaa')
	  expect(page).to have_content 'Usuário não encontrado'
	end

end	
