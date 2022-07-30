class ElevatorsController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]
    respond_to :json, :html

        def search
            @elevators = Elevator.where(column_id: params[:elevators])
            respond_with(@elevators)
        end
end
