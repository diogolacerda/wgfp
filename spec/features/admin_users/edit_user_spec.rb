require "rails_helper"

feature "Edit User Admin" do

  background do
    create_list(:profile, 3) 
  end
  let(:user) { create(:user, :consult) }
  let(:user_adm) { create(:user, :admin) }

  context 'Access Validation' do
    scenario 'redirect to login when not logged' do
      visit edit_admin_user_path user
      expect(current_path).to eql(new_session_path)
    end

    scenario 'redirect to root when profile = Consult' do
      not_adm = create(:user, :consult)
      login(not_adm.email, not_adm.password)
      visit edit_admin_user_path user
      expect(current_path).to eql root_path
    end

    scenario 'redirect to root when profile = Client' do
      not_adm = create(:user, :client)
      login(not_adm.email, not_adm.password)
      visit edit_admin_user_path user
      expect(current_path).to eql root_path
    end

    scenario 'profile == Administrador have access' do
      login(user_adm.email, user_adm.password)
      visit edit_admin_user_path user
      expect(current_path).to eql edit_admin_user_path user
    end
  end

  context 'Form Tests' do
    background do
      login(user_adm.email, user_adm.password)
    end
    
    scenario 'Block user', js: true do

      visit edit_admin_user_path user

      expect(user.is_blocked).to be false 
      check "user[is_blocked]"

      click_button "Salvar"
      sleep 1
      user.reload
      expect(user.is_blocked).to be true 
      expect(page).to have_content "Salvo com sucesso"
    end

    context 'Administrador' do
      let(:admin_user) { create(:user, :admin) }
      background do
        visit edit_admin_user_path admin_user
      end

      scenario 'success', js: true do
        new_email = Faker::Internet.email
        new_name = Faker::Name.name
        fill_in "user[email]", with: new_email
        fill_in "user[name]", with: new_name
        select Profile.first.name, from: "user[profile_id]"
        click_button "Salvar"
        sleep 1
        admin_user.reload
        expect(admin_user.name).to eql new_name
        expect(admin_user.email).to eql new_email
        expect(page).to have_content "Salvo com sucesso" 
      end

      scenario 'invalid with duplicated email', js: true do
        email_user = create(:user, :email => "teste@email.com")
        fill_in "user[email]", with: email_user.email
        click_button "Salvar"
        sleep 1
        expect(page).to have_content "Email já está em uso"
      end
      
      scenario 'invalid without email, name, profile', js: true do
        fill_in "user[email]", with: ""
        fill_in "user[name]", with: ""
        select "-- Selecione um perfil --", from: "user[profile_id]"
        click_button "Salvar"  
        sleep 1
        expect(page).to have_content "Email não pode ficar em branco" 
        expect(page).to have_content "Nome não pode ficar em branco" 
        expect(page).to have_content "Perfil não pode ficar em branco" 
      end
    end

  end


end