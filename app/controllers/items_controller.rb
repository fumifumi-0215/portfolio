class ItemsController < ApplicationController
before_action :correct_user,   only: :destroy

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      @feed_items = []
       flash[:danger] = "投稿失敗!"
      redirect_to root_url
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "投稿を削除しました!"
    redirect_to request.referrer || root_url
  end

  private

    def item_params
      params.require(:item).permit(:name, :category, :season, :description, :picture, :remove_picture )
    end
    
    def correct_user
      @item = current_user.items.find_by(id: params[:id])
      redirect_to root_url if @item.nil?
    end
end

  
