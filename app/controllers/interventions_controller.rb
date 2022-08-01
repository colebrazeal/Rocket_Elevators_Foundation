require 'rest_client'
require 'json'



class InterventionsController < ApplicationController
  respond_to :js, only: [:create]
  respond_to :html
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @intervention = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
    # @intervention = Intervention.find(params[:id])
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # def index
  #   @employee = Employee.all
  # end

  # def new
  #   @employee = Employee.new
  # end

  # def new
  #   @customers = Customer.new
  # end

  # def show
  #   @customers = Customer.find(params[:id])
  # end

  # def create
  #   company_name = params[:company_name]
  #   @customers = Customer.new(customer_params)
  #    @customers.company_name = company_name
  # end
 

  # def create
  #   company_name = params[:company_name]
  #   @customers = Customer.new(customer_params)
  #    @customers.company_name = company_name
  # end

  # def new 
  #   company_name = params[:company_name]
  #   @customers = Customer.new(customer_params)
  #     @customers.company_name = company_name
  # end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create

        freshdesk_domain = ENV["BASE_URL"]
        user_name_or_api_key =  ENV["FRESH_KEY"]
        password_or_x = "X"

        customer_id = params["client"]
        building_id = params["building"]
        battery_id = params["battery"]
        column_id = params["column"]
        elevator_id = params["elevator"]
        report = params["description"]
        created_at = params["created-at"]
        updated_at = params["updated-at"]
        employee_id = params["employee"]

        @intervention = Intervention.new(intervention_params)
          @intervention.author = current_user.id
          @intervention.customer_id = customer_id
          @intervention.building_id = building_id
          @intervention.battery_id = battery_id
          @intervention.column_id = column_id
          @intervention.elevator_id = elevator_id
          @intervention.start_date = nil
          @intervention.end_date = nil
          @intervention.result = "Incomplete"
          @intervention.report = report
          @intervention.status = "pending"
          @intervention.created_at = created_at
          @intervention.updated_at = updated_at
          @intervention.employee_id = employee_id


    # respond_to do |format|
    if user_signed_in?
      @intervention.employee_id = current_user.id
      @intervention.author = current_user.id
      @intervention.save!

      
      

      if @intervention.save
          redirect_back fallback_location: new_intervention_path, notice: "Intervention form has been sent successfully !"

          @customer = Customer.find(customer_id)
          puts @customer

        intervention_payload =  {
          status: 2,
          priority: 1,
          type: "Incident",
          email: @customer.email,
          # email: "bootyboy@gmail.com",   
          subject: "#{@customer.contact_name} from Building #{@customer.company_name} sent an intervention request #{Time.now}",
          description: "#{@customer.contact_name} from #{@customer.company_name} has requested for elevator #{@intervention.elevator_id}, in column #{@intervention.column_id}, with battery #{@intervention.battery_id} to be resolved in building #{@intervention.building_id}.<br/>
                        #{@intervention.employee_id} has been assigned to resolve this incident.<br/>
                        Request description: #{@intervention.report}"
          
          }
          freshdesk_api_path = 'api/v2/tickets'
          freshdesk_api_url  = "https://codeboxx4015.freshdesk.com/#{freshdesk_api_path}"

          site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)
          
          begin
            response = site.post(intervention_payload.to_json, {content_type: :json, accept: :json})
            # RestClient.post freshdesk_api_url, multipart_payload.to_json, {content_type: :json, accept: :json}
            puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
          rescue RestClient::Exception => exception
              puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
              puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
              puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
          end
        end
      end
    end

  

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
      format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.fetch(:intervention, {})
    end

 
  


end