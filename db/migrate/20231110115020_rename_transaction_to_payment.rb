class RenameTransactionToPayment < ActiveRecord::Migration[7.1]
    def change
      rename_table :transactions, :payments
    end
end
