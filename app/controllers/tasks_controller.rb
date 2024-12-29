class TasksController < ApplicationController
  # タスク一覧を表示するアクション
  def index
    @tasks = Task.all
  end

  # タスクの詳細を表示するアクション
  def show
    @task = Task.find(params[:id])
  end

  # 新しいタスクを作成するためのフォームを表示するアクション
  def new
    @task = Task.new
  end

  # 新しいタスクをデータベースに保存するアクション
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクが作成されました！"
    else
      render :new
    end
  end

  # 既存のタスクを編集するためのフォームを表示するアクション
  def edit
    @task = Task.find(params[:id])
  end

  # 既存のタスクをデータベースで更新するアクション
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "タスクが更新されました！"
    else
      render :edit
    end
  end

  # 既存のタスクを削除するアクション
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクが削除されました！"
  end

  private

  # ストロングパラメータで安全にパラメータを受け取る
  def task_params
    params.require(:task).permit(:title, :description)
  end
end
