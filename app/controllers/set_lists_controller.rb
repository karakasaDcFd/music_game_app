class SetListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user, only: [:create, :destroy]

  def new
    @match = Match.find(params[:mid])
    @set_list = @match.set_lists.build if logged_in?
  end

  def create
    @match = Match.find(params[:set_list][:match_id])
    @set_list = @match.set_lists.build(set_list_params)
    if @set_list.save
      flash[:success] = "課題曲を追加しました"
      redirect_to match_path(@match.id)
    else
      render 'new'
    end
  end

  def destroy
    @set_list = SetList.find(params[:id])
    @set_list.destroy
    flash[:success] = "課題曲を削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def set_list_params
      params.require(:set_list).permit(:title, :match_id)
    end
end
