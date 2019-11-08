class BanListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user, only: [:create, :destroy]

  def new
    @match = Match.find(params[:mid])
    @ban_list = @match.ban_lists.build if logged_in?
  end

  def create
    @match = Match.find(params[:ban_list][:match_id])
    @ban_list = @match.ban_lists.build(ban_list_params)
    if @ban_list.save
      flash[:success] = "禁止曲を追加しました"
      redirect_to match_path(@match.id)
    else
      render 'new'
    end
  end

  def destroy
    @ban_list = BanList.find(params[:id])
    @ban_list.destroy
    flash[:success] = "禁止曲を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def ban_list_params
      params.require(:ban_list).permit(:title, :match_id)
    end
end
