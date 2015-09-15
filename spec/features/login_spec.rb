
require "rails_helper"


feature "Login" do

	scenario 'invalid', js: true do
	  login('bbbb@bbb.bbb', 'aaaaaaa')
	  expect(page).to have_content 'Usuário não encontrado'
	end
	
end	
