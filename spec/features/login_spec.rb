
require "rails_helper"


feature "Login" do

	context 'Administrator' do
    scenario "success" , js:true do
      adm = create(:user, :profile_id => 1)
      login(adm.email, adm.password)
      expect(page).to have_content "Bem-vindo!"
      expect(current_path).to eq users_index_path
    end

  end

  context 'Consultant' do
    scenario "success" , js:true do
      adm = create(:user, :profile_id => 2)
      login(adm.email, adm.password)
      expect(page).to have_content "Bem-vindo!"
      expect(current_path).to eq users_index_path
    end

  end


  context 'Client' do
    scenario "is blocked" , js:true do
    	blocked_user = create(:user, :blocked, :profile_id => 3)
    	login(blocked_user.email, blocked_user.password)
    	expect(page).to have_content 'Usuário bloqueado'
    end

    scenario "is inactivated" , js:true do
    	inactivated_user = create(:user, :not_activated, :profile_id => 3)
    	login(inactivated_user.email, inactivated_user.password)
    	expect(page).to have_content 'Usuário inativado'
    end

    scenario "incomplete register" , js:true do
    	user = create(:user, :incomplete_register, :profile_id => 3)
    	login(user.email, user.password)
    	expect(page).to have_content 'Bem-vindo!'
    	expect(current_path).to eq users_new_path
    end

    scenario "complete register" , js:true do
    	user = create(:user, :complete_register, :profile_id => 3)
    	login(user.email, user.password)
    	expect(page).to have_content 'Bem-vindo!'
    	expect(current_path).to eq root_path
    end

  end


	scenario 'invalid', js: true do
	  login('bbbb@bbb.bbb', 'aaaaaaa')
	  expect(page).to have_content 'Usuário não encontrado'
	end

end	
