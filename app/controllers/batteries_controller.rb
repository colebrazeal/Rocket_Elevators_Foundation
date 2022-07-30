class BatteriesController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]
    respond_to :json, :html

        def search
            @batteries = Battery.where(building_id: params[:batteries])
            respond_with(@batteries)
        end
end
