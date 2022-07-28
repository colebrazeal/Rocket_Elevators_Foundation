class CustomersController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    respond_to :json, :html

        def search
            @customers = Customer.all
            respond_with(@customers)
        end
   
end
