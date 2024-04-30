class Admin::ArticlesController < ApplicationController  
    def new
        @article = Article.new
        render 'admin/articles/new'
    end

    def edit
        @article = Article.find(params[:id])
        render 'admin/articles/edit'
    end

    def index
        @articles = Article.all
    end

    def create
        @article = Article.new(article_params)
    
        respond_to do |format|
          if @article.save
            
            format.html { redirect_to article_url(@article), notice: "Zine was successfully created." }        
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @article.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @article = Article.find(params[:id])        

        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to "/articles/#{@article.id}", notice: "Zine was successfully updated." }
                format.json { render :show, status: :ok, location: @article }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @article = Article.find(params[:id])

        if @article.present?
            @article.destroy!
        end

        respond_to do |format|
            format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_article
            @article = Article.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def article_params
            params.require(:article).permit(:title, :subtitle, :author, :accent_color, :background_color, :content)
        end
end