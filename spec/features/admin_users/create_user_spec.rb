require "rails_helper"

feature "Create User Admin" do

	background do
    create_list(:profile, 2)
	  user = create(:user, :admin)
	  login(user.email, user.password)
	end

  scenario "success", js: true do
  	name = Faker::Name.name
  	email = Faker::Internet.email
  	pass = Faker::Internet.password(8)

    visit new_admin_user_path

    fill_in "user[name]", with: name
    fill_in "user[email]", with: email
    fill_in "user[password]", with: pass
    select Profile.first.name, from: "user[profile_id]"

    click_button "Salvar"
    sleep 1

    expect(User.last.name).to eq name 
    expect(User.last.email).to eq email 
    expect(User.last.profile_id).to eq Profile.first.id
    expect(page).to have_content "Salvo com sucesso" 
  end

  scenario 'invalid', js: true do
   visit new_admin_user_path
   click_button "Salvar"
   sleep 1
   expect(page).to have_content "Nome não pode ficar em branco" 
   expect(page).to have_content "Email não pode ficar em branco" 
   expect(page).to have_content "Senha não pode ficar em branco" 
   expect(page).to have_content "Perfil não pode ficar em branco" 
  end
end