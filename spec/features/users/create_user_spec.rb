require "rails_helper"

feature 'User - Create' do

	let(:password) { Faker::Internet.password }
  let(:email) { Faker::Internet.email }
  background do
    visit new_session_path
    click_link "Crie sua conta"
  end

  scenario 'success', js: true do
    fill_in "user[name]", with: Faker::Name.name
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
    click_button "Cadastrar"
    expect(page).to have_content "Seu cadastro foi realizado, mas para sua segurança, solicitamos que acesse a conta de e-mail cadastrada e acesse o link para validação de seus dados. Obrigado!" 
    expect(User.last.profile_id).to eq 3
    expect(open_last_email).to be_delivered_to email
  end

  scenario 'invalid without name, email, password', js: true do
    click_button "Cadastrar"
    expect(page).to have_content "Nome não pode ficar em branco"
    expect(page).to have_content "Email não pode ficar em branco" 
    expect(page).to have_content "Senha não pode ficar em branco" 
  end

  scenario 'invalid with invalid email', js: true do
    fill_in "user[email]", with: "aaa"
    click_button "Cadastrar"
    expect(page).to have_content "Email não é válido"
  end

  scenario 'invalid with duplicated email', js: true do
    user = create(:user)
    fill_in "user[name]", with: Faker::Name.name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
    click_button "Cadastrar"
    expect(page).to have_content "Email já está em uso"
  end

  scenario 'invalid with short password', js: true do
    short_password = Faker::Internet.password(4)
    fill_in "user[password]", with: short_password
    click_button "Cadastrar"
    expect(page).to have_content "Senha é muito curto"
  end

  scenario 'invalid with wrong password confirmation', js: true do
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: 'other password'
    click_button "Cadastrar"
    expect(page).to have_content "Confirmação de Senha não é igual a Senha"
  end

end