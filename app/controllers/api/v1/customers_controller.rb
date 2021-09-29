class Api::V1::CustomersController < ApplicationController

    def index
        @customers = Customer.all
        render json: @customers
      end
    
      def create
          @customer = customer.new(customer_params)
    
        if @customer.save
          render json: @customer
        else
          render json: {error: 'Error creating customer'}
        end
      end
    
      def update
    
           @customer = customer.find(customer_params[:id])
           @customer.update(customer_params)
            if @customer.save
             render json: @customer
           else
             render json: {error: 'Error editing customer'}
           end
      end
    
      def show
        @customer = Customer.find(params[:id])
        render json: @customer
      end
    
      def destroy
       @customer = Customer.find(params[:id])
        @customer.destroy
    
        # @customers = customer.find_by(dino_type_id: params['dino_type_id'])
        # render json: @customers
    
      end
    
    private
 
    
      def customer_params
        params.permit(:id, :name, :email)
      end



end
