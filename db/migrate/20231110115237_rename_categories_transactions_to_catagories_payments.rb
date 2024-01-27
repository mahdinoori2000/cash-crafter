class RenameCategoriesTransactionsToCatagoriesPayments < ActiveRecord::Migration[7.1]
  def change
    rename_table :categories_transactions, :categories_payments
  end
end
