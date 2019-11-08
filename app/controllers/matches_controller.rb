class MatchesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def show
    @match = Match.find(params[:id])
    @set_lists = @match.set_lists
    @ban_lists = @match.ban_lists
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = "試合の登録に成功しました"
      redirect_to @match
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(match_params)
      flash[:success] = "Profile updated"
      redirect_to @match
    else
      render 'edit'
    end
  end

  def index
    @matches = Match.paginate(page: params[:page])
  end

  def destroy
    Match.find(params[:id]).destroy
    flash[:success] = "Match deleted"
    redirect_to matches_url
  end

  private

    def match_params
      params.require(:match).permit(:restriction_level, :date, :place)
    end

    # 管理者かどうか確認
    # def admin_user
      # redirect_to(root_url) unless current_user.admin?
    # end
end
