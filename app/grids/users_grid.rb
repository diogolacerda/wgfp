class UsersGrid
	
	include Datagrid

	scope do
		User.order(:name)
    User.includes(:profile)
    User.includes(:city)
    User.includes(:state)
  end


  filter(:state_id, :enum, :include_blank => '-- Selecione um Estado --', :select => proc { State.all.map {|c| [c.name, c.id] }}, :header => "Estado")

  filter(:name, :string, :header => "Nome Completo") do |value|
    self.where("proposals.name LIKE ? ", "%#{value}%")
  end

  filter(:consultant_id, :enum, :include_blank => '-- Selecione um Consultor --', :reject_if => "@current_user.profile_id != 1", :select => proc { User.where(:profile_id => 2).map {|c| [c.name, c.id] }}, :header => "Consultor")

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
end