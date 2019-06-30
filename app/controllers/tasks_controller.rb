class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = User.find(current_user.id).tasks.page(params[:page]).per(5)
  end

  def show
  end

  def new
     @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
     if @task.save
       format.html { redirect_to tasks_path, notice: 'movie was successfully created.' }
       format.json { render :show, status: :created, location: @task }
     else
       format.html { render :new }
       format.json { render json: @task.errors, status: :unprocessable_entity }
     end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_path, notice: 'movie was successfully updated.' }
        format.json { render :edit, status: :updated, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.remove
        format.html { redirect_to tasks_path, notice: 'Movie was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      {user:current_user}.merge(params.require(:task).permit(:title,:description,:delivery))
    end
end
