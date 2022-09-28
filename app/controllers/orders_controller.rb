class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
        @item = Item.find(params[:id])
    end

    def create
        @order = Order.new(order_params)
        # ItemモデルをDBへ保存
        if @order.save
            redirect_to items_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
    end

    def show
        @item = Item.find(params[:id])
        @order = Order.new
    end

    def update
    end

    def destroy
    end

    private
    def order_params
        params.require(:order).permit(:buyer_id, :seller_id, :item_id)
    end

end
