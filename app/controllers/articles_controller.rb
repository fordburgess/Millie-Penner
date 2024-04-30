class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @Article = Article.find(params[:id])  
    end
end