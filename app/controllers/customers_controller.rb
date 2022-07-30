class CustomersController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    respond_to :json, :html

        def search
            @customers = Customer.all
            respond_with(@customers)
        end

        # def set_customer
        #     @customers = Customer.find(params[:id])
        # end
      
        #   def customer_params
        #     params.fetch(:customer, {})
        #   end

        #   def create
        #     company_name = params[:company_name]
        #     @customers = Customer.new(customer_params)
        #      @customers.company_name = company_name
        #   end
   
end
