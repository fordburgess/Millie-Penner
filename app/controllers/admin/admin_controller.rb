class Admin::AdminController < ApplicationController  
    def dashboard
        render 'admin/dashboard'
    end

    def zines_all
        @zines = Zine.all
        render 'admin/zines/zines_all'
    end
    
    before_action :authenticate_user!
end