class RenameTransactionsIdToPaymentsIdInCategoriesPayments < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories_payments, :transactions_id, :payments_id
  end
end
