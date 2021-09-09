class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    # 撮ってくる処理をかかないとうごかない
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
# saveする処理がない
    # puts '-' * 80
    # p @task
    # puts '-' * 80
    if @task.save   # ← ここの処理が抜けてる。
    #   #saveが完了したら、一覧ページへリダイレクト
      redirect_to tasks_path
      else
    #   #saveを失敗すると新規作成ページへ
    #   puts '登録しっぱい'
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_url
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  private
    def task_params
      params.require(:task).permit(:title, :content)
    end
end
