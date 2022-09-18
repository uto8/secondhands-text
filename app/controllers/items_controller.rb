class ItemsController < ApplicationController
    # 出品物の一覧
    def index
        @items = Item.all
    end

    # 出品物詳細ページ
    def show
        @item = Item.find(params[:id])
    end

    # 質問の作成
    def new
        @item = Item.new
    end

    # 質問の編集
    def edit
        @item = Item.find(params[:id])
    end

    # 質問の更新
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to items_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    # 出品物の登録
    def create
        @item = Item.new(item_params)
        # ログインしているユーザーidとの紐付け
        @item.user_id = current_user.id
        # ItemモデルをDBへ保存
        if @item.save
            redirect_to items_path
        else
            render 'new', status: :unprocessable_entity
        end
    end

    # 出品物の削除
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path
    end

    private
    def item_params
        params.require(:item).permit(:name, :price, :description, :delivery_fee)
    end
end
