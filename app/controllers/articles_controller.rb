class ArticlesController < ApplicationController
    def index
        @articles = Article.all
        @pdf_articles = PdfArticle.all
    end

    def show
        @article = Article.find(params[:id])  
    end
end