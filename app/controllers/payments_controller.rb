class PaymentsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @payment = Payment.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @categories = Category.where(user_id: current_user.id)

    return if params[:payment][:category_id].nil?

    category_id = params[:payment][:category_id]
    @payment = Payment.new(payment_params)

    if @payment.save
      @category_payment = CategoryPayment.new(category_id:, payment_id: @payment.id)

      if @category_payment.save
        flash[:notice] = 'Payment and CategoryPayment were successfully created.'
        redirect_to category_payments_path(category_id:)
      else
        flash[:alert] = 'CategoryPayment was not saved.'
        render :new
      end
    else
      flash[:alert] = 'Payment was not saved.'
      render :new
    end
  end

  def destroy
    @payment.destroy!

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:author_id, :name, :amount)
  end

  def category_payment_params
    params.require(:category_payment).permit(:payment_id, :category_id)
  end
end
