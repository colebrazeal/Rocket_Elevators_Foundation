require 'aws-sdk-polly'
class PagesController < ApplicationController
    # before_action :authorize!, :login
    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
        redirect_to root_path
      end
    def index
    end

    def residential
    end

    def commercial
    end

    def quote
    end

    def reado
         
    end

    def interventions
    end
   
    def login
        if user.admin?
        link_to "/admin"
        end
    end

    # def check_if_admin
    #     redirect_to root_path unless current_user.is_admin == true
    # end

    # RailsAdmin.config do |config|
    # end
end
