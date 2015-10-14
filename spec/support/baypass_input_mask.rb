module BaypassInputMask
	def fill_cep(value = false)
		if !value
			value = "30660630"
		end
		page.execute_script '$("#user_zip_code").focus();'
		sleep 1
    page.execute_script "$('#user_zip_code').val('#{value}');"
    sleep 1
    page.execute_script '$("#user_street").focus();'
    
	end

	def fill_cnpj(value = false)
		if !value
			value = "19770116000138"
		end
		page.execute_script '$("#user_cnpj").focus();'
		sleep 1
    page.execute_script "$('#user_cnpj').val('#{value}');"
    sleep 1
	end

	def fill_cpf(value = false)
		if !value
			value = "77854186758"
		end
		page.execute_script '$("#user_cpf").focus();'
		sleep 1
    page.execute_script "$('#user_cpf').val('#{value}');"
    sleep 1
	end

	def fill_birthday(value = false)
		if !value
			value = "05/10/1985"
		end
    page.execute_script "$('#user_birthday').val('#{value}');"
	end

end