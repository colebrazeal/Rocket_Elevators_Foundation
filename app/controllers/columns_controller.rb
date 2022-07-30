class ColumnsController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]
    respond_to :json, :html

        def search
            @columns = Column.where(battery_id: params[:columns])
            respond_with(@columns)
        end
end
