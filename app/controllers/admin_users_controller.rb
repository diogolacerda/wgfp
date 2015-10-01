class AdminUsersController < ApplicationController
  
  def index
  	@grid = UsersGrid.new(params[:users_grid]) do |scope|
			scope.page params[:page]
		end

    # Consultor e Status somente para Admin
		if @current_user.profile_id == 1

      @grid.column(:consultant, :html => true, :header => "Consultor") do |record|
		  	if record.consultant
		      record.consultant.name
		    end
		  end
		  @grid.column(:is_blocked, :html => true, :header => "Status")
		  @grid.column(:actions, :html => true) do |record|
        render "datagrid_actions", :object => record  
      end
    end
    
    # Coluna de editar apenas para Consultor
    if @current_user.profile_id == 2

      @grid.column(:actions, :html => true) do |record|
        render "datagrid_actions_edit", :object => record  
      end
    end

  end

  def new
  	@user = User.new
  end

  def edit
  end

  def create
  end
end
