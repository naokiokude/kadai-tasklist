class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(parms[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      falash[:success] = 'タスクが作成されました'
      redirect_to_@task
    else
      flash.now[:danger] = 'タスクの作成に失敗しました'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスクが更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'タスクの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'タスクが削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
end
