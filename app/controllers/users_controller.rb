class UsersController < ApplicationController
    before_action :set_branch
    def index
        @users = @branch.users
    end

    def show
        @user = @branch.users.find(params[:id])
    end

    def select_type
        @branch = Branch.find(params[:branch_id])
    end

    def new
        @role = User.roles.keys.map {|role| [role.titleize,role]}
        @user = @branch.users.build
    end

    def existing_customer
        @branch = Branch.find(params[:branch_id])
        @users = @branch.users
    end

   
    def create
        @user = @branch.users.build(user_params)
        @user.add_role(params[:role])
        if @user.save
            redirect_to branch_users_path
        else
            render :new
        end
    end

   

  private
    def set_branch
        @branch = Branch.find(params[:branch_id])
    end

    def user_params
      params.require(:user).permit(:fname, :lname, :contact_no, :email, :address, :password,:password_confirmation, :branch_id)
    end
end
