class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    # 撮ってくる処理をかかないとうごかない
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.create(bike_params)
# saveする処理がない
    # puts '-' * 80
    # p @bike
    # puts '-' * 80
    if @bike.save   # ← ここの処理が抜けてる。
    #   #saveが完了したら、一覧ページへリダイレクト
      redirect_to bikes_path
      else
    #   #saveを失敗すると新規作成ページへ
    #   puts '登録しっぱい'
      render 'new'
    end
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to bikes_url
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bikes_url
  end

  private
    def bike_params
      params.require(:bike).permit(:title, :content)
    end
end
