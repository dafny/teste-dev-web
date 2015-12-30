class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new(dog_id: params[:dog_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to add_to_cart_purchases_dogs_path(dog_id: @purchase.dog_id, purchase_id: @purchase) }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, alert: @purchase.errors.full_messages }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:dog_id, :name, :registry_number, :email, :address,
            :address_number, :complement, :city, :state, :cep)
    end
end
