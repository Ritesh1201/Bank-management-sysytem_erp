class TransactionsController < ApplicationController
    before_action :set_account

    def index
        @transactions = @account.transactions
    end

    def new
        @transaction = @account.transactions.build
    end

    def show
        @transaction = @account.transactions.find(params[:id])
    end

    def create
        @transaction = @account.transactions.build(transaction_params)

        if @transaction.save
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def set_account
        @account = Account.find(params[:account_id])
    end

    def transaction_params
        params.require(:transaction).permit(:tsc_no, :account_id)
    end
end
