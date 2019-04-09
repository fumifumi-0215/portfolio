class ItemsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def item_params
      params.require(:item).permit(:name, :category, :season, :description )
    end
end

  
