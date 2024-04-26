class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    # OrderMailer.order_confirmation(@order).deliver_now
    allowed_referer = 'https://millicentpenner.xyz/orders/new'
    if request.referer.present? && request.referer == allowed_referer
      current_cart.empty_items()
      render 'orders/show'
    else      
      render plain: "Unauthorized access", status: :unauthorized
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create    
    @order = Order.new(order_params)

    @current_cart.zines.each do |zine|
      @order.zines << zine
    end

    respond_to do |format|
      if @order.save        
        format.json { render json: @order.id }
        # format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        # format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        head :no_content
        # format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        # format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      # params.require(:order).permit(:name, :email, :product, :address, :pay_method, :total)
      params.require(:order).permit(:name, :email, :address, :total)
    end
end
