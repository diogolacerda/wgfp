require "rails_helper"

feature 'User - Edit pass' do
  
  scenario 'success comming from recover pass email', js: true do
    recover_user = create(:user, :recovered)
    new_pass = Faker::Internet.password(8)
    visit edit_pass_token_path(recover_user.recovery_token)
    expect(page).to have_content "Senha"
    expect{
        fill_in "user[password]", with: new_pass
        fill_in "user[password_confirmation]", with: new_pass
        click_button "Enviar"
        sleep 1
        recover_user.reload
    }.to change{ recover_user.password_digest } 
    sleep 1
    expect(page).to have_content "Salvo com sucesso" 
  end

  scenario 'success when already logged', js: true do
    user = create(:user)
    new_pass = Faker::Internet.password(8)
    login(user.email, user.password)
    sleep 1
    visit edit_pass_path
    sleep 1
    expect{
        fill_in "user[password]", with: new_pass
        fill_in "user[password_confirmation]", with: new_pass
        click_button "Enviar"
        sleep 1
        user.reload
    }.to change{ user.password_digest }
    sleep 1
    expect(page).to have_content "Salvo com sucesso"
  end

  scenario 'invalid with short password', js: true do
    user = create(:user)
    wrong_pass = Faker::Internet.password(4)
    login(user.email, user.password)
    sleep 1
    visit edit_pass_path
    fill_in "user[password]", with: wrong_pass
    fill_in "user[password_confirmation]", with: wrong_pass
    click_button "Enviar"
    sleep 1
    expect(page).to have_content "Senha é muito curto"
  end

  scenario 'invalid with wrong password confirmation', js: true do
    user = create(:user)
    new_pass = Faker::Internet.password(8)
    login(user.email, user.password)
    sleep 1
    visit edit_pass_path
    fill_in "user[password]", with: new_pass
    fill_in "user[password_confirmation]", with: "other_pass"
    click_button "Enviar"
    sleep 1
    expect(page).to have_content "Confirmação de Senha não é igual a Senha"
  end

  scenario 'invalid without password confirmation', js: true do
    user = create(:user)
    new_pass = Faker::Internet.password(8)
    login(user.email, user.password)
    sleep 1
    visit edit_pass_path
    fill_in "user[password]", with: new_pass
    click_button "Enviar"
    sleep 1
    expect(page).to have_content "Confirmação de Senha não é igual a Senha"
  end
end