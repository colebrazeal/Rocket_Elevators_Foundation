class EmployeeController < ApplicationController
    respond_to :json, :html

        def search
            @employees = Employee.all
            respond_with(@employees)
        end
end

# def show
#     @admin = Admin.find(params[:id])
#     authorize! :show, @admin
#   end
