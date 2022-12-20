class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  # GET /purchases or /purchases.json
  def index
    @category = current_user.categories.find(params[:category_id])
  end

  # GET /purchases/1 or /purchases/1.json
  def show
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  # GET /purchases/new
  def new
    @category = Category.find(params[:category_id])
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @category = Category.find(params[:category_id])
    @purchase = @category.purchases.new(name: purchase_params[:name],
                                        amount: purchase_params[:amount], user_id: current_user.id)
    if @purchase.save
      flash[:notice] = 'purchase is completed'
      redirect_to category_purchases_path(@category)
    else
      flash[:notice] = 'Invalid purchase!'
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount, :user_id, :category_id)
  end
end
