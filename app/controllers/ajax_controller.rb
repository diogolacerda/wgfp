class AjaxController < ApplicationController
	def busca_cep
		require 'correios-cep'
		  address = Correios::CEP::AddressFinder.get(params[:cep])
		  data = {
	      :address => address
	    }

	    # Encaminha a resposta
	    respond_to do |format|
	      format.json {render :json => data, :status => 200}
	    end
		
	end
end