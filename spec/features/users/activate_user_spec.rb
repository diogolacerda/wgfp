require "rails_helper"

feature 'User - Activate' do
  
  scenario 'success', js: true do
    user = create(:user, :not_activated)
    
    expect {
    	visit activate_account_path(user.activation_token)
    	user.reload
    }.to change { user.is_activated }.from(false).to(true)
    
    expect(page).to have_content "Acesso validado com sucesso"
  end
end