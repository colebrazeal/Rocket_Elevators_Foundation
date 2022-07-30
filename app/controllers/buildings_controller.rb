class BuildingsController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    respond_to :json, :html

        def search
            @buildings = Building.where(customer_id: params[:buildings])
            respond_with(@buildings)
        end
   
end
