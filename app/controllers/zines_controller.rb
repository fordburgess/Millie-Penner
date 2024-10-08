class ZinesController < ApplicationController
  before_action :set_zine, only: %i[ show edit update destroy ]

  # GET /zines or /zines.json
  def index
    @filtered_zines = Zine.all.reject { |z| 
      ["friend application vol. 1", "friend application vol. 2", "friend application vol. 3"].include?(z.title.downcase)    
    }

    @latest_zines = Zine.all.select { |z|
      ["friend application vol. 1", "friend application vol. 2", "friend application vol. 3"].include?(z.title.downcase)    
    }
  end

  # GET /zines/1 or /zines/1.json
  def show
    @zine = Zine.find(params[:id])  
  end

  def zines_ajax
    @zine = Zine.find(params[:id])
    render json: { zine: @zine, cover_image: url_for(@zine.cover_image) }
  end

  # GET /zines/new
  def new
  end

  # GET /zines/1/edit
  def edit
  end

  # POST /zines or /zines.json
  def create
    # @zine = Zine.new(zine_params)

    # respond_to do |format|
    #   if @zine.save
    #     pdf_url = @zine.zine_pdf.url
    #     PdfToImageConverter.new(pdf_url, @zine).convert_to_images

    #     format.html { redirect_to zine_url(@zine), notice: "Zine was successfully created." }        
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @zine.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /zines/1 or /zines/1.json
  def update
    # respond_to do |format|
    #   if @zine.update(zine_params)
    #     format.html { redirect_to zine_url(@zine), notice: "Zine was successfully updated." }
    #     format.json { render :show, status: :ok, location: @zine }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @zine.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /zines/1 or /zines/1.json
  def destroy
    # @zine.destroy!

    # respond_to do |format|
    #   format.html { redirect_to zines_url, notice: "Zine was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zine
      # @zine = Zine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def zine_params
      # params.require(:zine).permit(:title, :price, :size, :pages, :description, :cover_image, :background_image, :zine_pdf)
    end
end
