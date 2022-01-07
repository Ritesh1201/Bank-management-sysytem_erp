class BranchesController < ApplicationController
    before_action :set_bank
    
    def index
        @branches = @bank.branches
    end

    def show
        @branch = @bank.branches.find(params[:id])
    end

    def new
        @branch = @bank.branches.build
    end

    def edit
    end

    def create
        @branch = @bank.branches.build(branch_params)

        if @branch.save
            redirect_to bank_path(@bank)
        else
            render :new
        end
    end

    def update
        @branch = Branch.find(params[:id])
        if
            @branch.update(branch_params)
            rendre_to root_path
        else
            rendre_to :edit
        end
    end

  private
    def set_bank
        @bank = Bank.find(params[:bank_id])
    end
    def branch_params
      params.require(:branch).permit(:name, :ifsc_code, :address, :bank_id)
    end
end
