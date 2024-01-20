class RenameCategoriesPaymentsToCategoryPaymentsInCategoriesPayments < ActiveRecord::Migration[7.1]
  def change
    rename_table :categories_payments, :category_payments
  end
end
