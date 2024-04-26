class Admin::ZinesController < ApplicationController  
    def new
        @zine = Zine.new
        render 'admin/zines/new'
    end

    def edit
        @zine = Zine.find(params[:id])
        render 'admin/zines/edit'
    end

    def create
        @zine = Zine.new(zine_params)
    
        respond_to do |format|
          if @zine.save
            pdf_url = @zine.zine_pdf.url
            PdfToImageConverter.new(pdf_url, @zine).convert_to_images
    
            format.html { redirect_to zine_url(@zine), notice: "Zine was successfully created." }        
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @zine.errors, status: :unprocessable_entity }
          end
        end
    end

     # PATCH/PUT /zines/1 or /zines/1.json
    def update
        @zine = Zine.find(params[:id])        

        respond_to do |format|
            if @zine.update(zine_params)
                format.html { redirect_to "/zines/#{@zine.id}", notice: "Zine was successfully updated." }
                format.json { render :show, status: :ok, location: @zine }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @zine.errors, status: :unprocessable_entity }
            end
        end
    end

  # DELETE /zines/1 or /zines/1.json
    def destroy
        @zine = Zine.find(params[:id])

        if @zine.present?
            @zine.destroy!
        end

        respond_to do |format|
            format.html { redirect_to admin_zines_all_path, notice: "Zine was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_zine
            @zine = Zine.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def zine_params
            params.require(:zine).permit(:title, :price, :size, :pages, :description, :pdf_url, :cover_image, :background_image, :zine_pdf)
        end
end