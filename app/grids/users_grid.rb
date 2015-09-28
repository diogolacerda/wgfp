class UsersGrid
	
	include Datagrid

	scope do
		User.order(:name)
    User.includes(:profile)
    User.includes(:city)
    User.includes(:state)
  end

  column(:name, :html => true, :header => "Nome Completo")
  column(:email, :html => true, :header => "Email")
  column(:phone, :html => true, :header => "Telefone")
  column(:celphone, :html => true, :header => "Celular")
  column(:state, :html => true, :header => "Estado") do |record|
  	if record.state
      record.state.name
    end
  end
  column(:city, :html => true, :header => "Cidade") do |record|
  	if record.city
      record.city.name
    end
  end
  column(:consultant, :html => true, :header => "Consultor") do |record|
  	if record.consultant
      record.consultant.name
    end
  end
  column(:is_blocked, :html => true, :header => "Status")

  column(:actions, :html => true, :header => "Ações") do |record|
    render "datagrid_actions", :object => record  
  end


end