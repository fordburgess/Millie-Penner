class Admin::PdfArticlesController < ApplicationController
    def new
        @pdf_article = PdfArticle.new
        render 'admin/pdf_articles/new'
    end

    def edit
        @pdf_article = PdfArticle.find(params[:id])
        render 'admin/pdf_articles/edit'
    end

    def create
        @pdf_article = PdfArticle.new(pdf_article_params)
    
        respond_to do |format|
          if @pdf_article.save            
    
            format.html { redirect_to admin_root_url, notice: "PDF Article was successfully created." }        
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @pdf_article.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @pdf_article = PdfArticle.find(params[:id])        

        respond_to do |format|
            if @pdf_article.update(article_params)                
                format.html { redirect_to admin_root_url, notice: "PDF Article was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @pdf_article.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @pdf_article = pdf_article.find(params[:id])

        if @pdf_article.present?
            @pdf_article.destroy!
        end

        respond_to do |format|
            format.html { redirect_to admin_root, notice: "Article was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private        

        # Only allow a list of trusted parameters through.
        def pdf_article_params
            params.require(:pdf_article).permit(:title, :link, :cover_image)
        end
end