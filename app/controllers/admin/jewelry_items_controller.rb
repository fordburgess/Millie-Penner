class Admin::JewelryItemsController < ApplicationController
    def index
      @jewelry_items = JewelryItem.all
    end
    
    def new
        @jewelry_item = JewelryItem.new
        render 'admin/jewelry_items/new'
    end

    def edit
        @jewelry_item = JewelryItem.find(params[:id])
        render 'admin/jewelry_items/edit'
    end

    def create
        @jewelry_item = JewelryItem.new(jewelry_item_params)
    
        respond_to do |format|
          if @jewelry_item.save
            
            # format.html { redirect_to jewelry_item_url(@jewelry_item), notice: "Jewelry Item was successfully created." }        
            format.html { redirect_to admin_root_url, notice: "Item successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @jewelry_item.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
      @jewelry_item = JewelryItem.find(params[:id])        

      respond_to do |format|
          if @jewelry_item.update(jewelry_item_params)
              format.html { redirect_to "/jewelry_items/#{@jewelry_item.id}", notice: "Jewelry Item was successfully updated." }
              format.json { render :show, status: :ok, location: @jewelry_item }
          else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @jewelry.errors, status: :unprocessable_entity }
          end
      end
    end

    def destroy
        @jewelry_item = JewelryItem.find(params[:id])

        if @jewelry_item.present?
          @jewelry_item.destroy
        end

        respond_to do |format|
            format.html { redirect_to admin_jewelry_items_url, notice: "Jewelry item was successfully destroyed." }
            format.json { head :no_content }
        end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_jewelry_item
        @jewelry_item = JewelryItem.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def jewelry_item_params
        params.require(:jewelry_item).permit(:title, :materials, :description, :price, :in_stock, images: [])
      end
end