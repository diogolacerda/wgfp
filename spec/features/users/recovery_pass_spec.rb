require "rails_helper"

feature 'User - Recover Pass' do
	let(:user) { create(:user) }
  
  scenario 'success', js: true do
    visit new_session_path
    expect {
      click_link "Esqueci minha senha"
      fill_in "email", with: user.email
      click_button "Enviar"
      user.reload
    }.to change { user.recovery_token }
    expect(open_last_email).to be_delivered_to user.email
    expect(page).to have_content "Verifique em seu email sua nova senha"
  end

  scenario 'invalid', js: true do
    visit new_session_path
    click_link "Esqueci minha senha"
    click_button "Enviar"
    expect(page).to have_content "Email não encontrado"
  end
end