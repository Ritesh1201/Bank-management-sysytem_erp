class Account < ApplicationRecord
    belongs_to :branch, dependent: :destroy
    belongs_to :user
    has_many :transactions

    before_create :inc_acc_no
    def inc_acc_no
        self.acc_no = Account.last.try(:acc_no) + 1
    end
end
