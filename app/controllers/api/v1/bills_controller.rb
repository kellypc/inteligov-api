module Api::V1
  class BillsController < ApplicationController
    before_action :authenticate_api_user!
    before_action :set_bill, only: [:show, :update, :destroy]

    def index
      @bills = Bill.order(:id)

      render json: @bills
    end

    def new
      new_bill = BillsService.new(bill_params[:ext_id]).get_new_bill

      Bill.create(new_bill.except(:steps))

      render json: new_bill
    end

    def create
      @bill = Bill.new(bill_params)

      if @bill.save
        render json: @bill, status: :created
      else
        render json: @bill.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @bill.destroy
    end

    private
      def set_bill
        @bill = Bill.find(params[:id])
      end

      def bill_params
        params.require(:bill).permit(:ext_id)
      end
  end
end
