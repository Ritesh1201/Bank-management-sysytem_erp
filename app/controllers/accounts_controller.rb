class AccountsController < ApplicationController
    before_action :set_account, only: %i[ show edit update destroy ]

      def index
        if params[:user_id]
          @user = User.find(params[:user_id])
          @accounts = @user.accounts
        else
          @branch = Branch.find(params[:branch_id])
          @accounts = @branch.accounts
        end
      end
    
     
      def show
      end
    
      
      def new
        if params[:user_id]
          begin
          @user = User.find(params[:user_id])
          rescue ActiveRecord::RecordNotFound => e
            print e
          end
        end
        if params[:branch_id]
          begin
          @branch = Branch.find(params[:branch_id])
          rescue ActiveRecord::RecordNotFound => e
            print e
          end
        end
        @account = Account.new(branch_id: @branch&.id, user_id: @user&.id)
      end
    
      
      def edit
        
      end
    
      
      def create
        @account = Account.new(account_params)
    
          if @account.save
            redirect_to root_path
          else
            redirect_to root_path
          end
      end
    
    
      
      def update
        respond_to do |format|
          if @account.update(account_params)
            format.html { redirect_to root_path }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end
    
      
      
    
    

  private
    def set_account
        @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:acc_type, :branch_id, :user_id)
    end
end