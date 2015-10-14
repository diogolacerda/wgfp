require "rails_helper"

feature 'Create/Edit - Step 1' do

	let (:user_client) {create(:user, :incomplete_register)}
	let (:user_admin) {create(:user, :admin)}

	background do
		create(:user, :consult)
		create_list(:civil_state, 2)
		create_list(:nationality, 5)
		create_list(:state, 5)
		create(:state, :name => 'Minas Gerais', :acronym => 'MG')
		create_list(:city, 5)
		create(:city, :name => 'Belo Horizonte')
	end

	scenario 'invalid input', js: true do

		login(user_client.email, user_client.password)
	  visit user_step_path(user_client, 1)
	  sleep 1
		click_button "Salvar e ir para o próximo"
		sleep 1
		expect(page).to have_content "Email secundário não pode ficar em branco"
    expect(page).to have_content "Celular não pode ficar em branco"
		expect(page).to have_content "Data de nascimento não pode ficar em branco"
		expect(page).to have_content "Estado civil não pode ficar em branco"
		expect(page).to have_content "Nacionalidade não pode ficar em branco"
		expect(page).to have_content "Profissão não pode ficar em branco"
    expect(page).to have_content "CPF não pode ficar em branco"
		expect(page).to have_content "RG não pode ficar em branco"
		expect(page).to have_content "Orgão emissor não pode ficar em branco"
    expect(page).to have_content "CEP não pode ficar em branco"
    expect(page).to have_content "Endereço não pode ficar em branco"
    expect(page).to have_content "Bairro não pode ficar em branco"
    expect(page).to have_content "Cidade não pode ficar em branco"
    expect(page).to have_content "Estado não pode ficar em branco"

	end

	context 'Administrator' do

		background do
	    login(user_admin.email, user_admin.password)
	    visit user_step_path(user_client, 1)
	    sleep 1
		end

		scenario 'success - input data', js: true  do
			
			select User.first.name, from: "user[consultant_id]"
			fill_in 'user[email_secondary]', with: Faker::Internet.email
			fill_in 'user[phone]', with: Faker::PhoneNumber.cell_phone
			fill_in 'user[celphone]', with: Faker::PhoneNumber.cell_phone
			fill_birthday
			select CivilState.first.name, from: "user[civil_state_id]"
			select Nationality.first.name, from: "user[nationality_id]"
			fill_in 'user[profession]', with: Faker::Company.buzzword
			fill_cep
			sleep 2
			fill_in 'user[complement]', with: Faker::Address.secondary_address
			fill_cpf
			fill_in 'user[rg]', with: "MG 12.231.232"
			fill_in 'user[issuer]', with: Faker::Address.state_abbr

			click_button "Salvar e ir para o próximo"
			sleep 2
			expect(page).to have_content "Salvo com sucesso"
			sleep 1
			expect(current_path).to eql(user_step_path(user_client, 2))

		end

	end

	context 'Client/Consultant' do

		background do
	    login(user_client.email, user_client.password)
	    visit user_step_path(user_client, 1)
	    sleep 1
		end

		scenario 'success - input data', js: true  do

			expect(page).not_to have_content "Planejador:"


			fill_in 'user[email_secondary]', with: Faker::Internet.email
			fill_in 'user[phone]', with: Faker::PhoneNumber.cell_phone
			fill_in 'user[celphone]', with: Faker::PhoneNumber.cell_phone
			fill_birthday
			select CivilState.first.name, from: "user[civil_state_id]"
			select Nationality.first.name, from: "user[nationality_id]"
			fill_in 'user[profession]', with: Faker::Company.buzzword
			fill_cep
			sleep 2
			fill_in 'user[complement]', with: Faker::Address.secondary_address
			fill_cpf
			fill_in 'user[rg]', with: "MG 12.231.232"
			fill_in 'user[issuer]', with: Faker::Address.state_abbr

			click_button "Salvar e ir para o próximo"
			sleep 2
			expect(page).to have_content "Salvo com sucesso"
			sleep 1
			expect(current_path).to eql(user_step_path(user_client, 2)) 


		end


	end		




end