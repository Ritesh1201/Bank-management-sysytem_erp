class Transaction < ApplicationRecord
    belongs_to :account, dependent: :destroy

    before_create :inc_tsc_no
    def inc_tsc_no
        self.tsc_no = Transaction.last.try(:tsc_no) + 1
    end
end