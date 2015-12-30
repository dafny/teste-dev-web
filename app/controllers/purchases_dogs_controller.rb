class PurchasesDogsController < ApplicationController

  def index
    @purchases_dogs = Cart.new(session)
  end

  def add_to_cart
    @purchases_dogs = Cart.new(session, params[:purchase_id])
    @purchases_dogs.add_dog_to_cart_hash(params[:dog_id])
    redirect_to purchases_dogs_path
  end

  def create
    @purchases_dogs = Cart.new(session)

    respond_to do |format|
      if @purchases_dogs.save_cart
        format.html { redirect_to dogs_path, notice: 'Sua compra foi efetuada com sucesso' }
        format.json { render :show, status: :created }
      else
        format.html { render :index, alert: 'Ocorreu um erro ao processar compra' }
        format.json { render json: 'Ocorreu um erro ao processar compra',  status: :unprocessable_entity }
      end
    end
  end

  private
    def purchases_dog_params
      params.require(:purchases_dog).permit(:quantity, :dog_id, :purchase_id)
    end
end
