class RenamePaymentsIdToPaymentIdInCategoriesPayments < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories_payments, :payments_id, :payment_id
  end
end
