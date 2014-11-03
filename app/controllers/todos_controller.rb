class TodosController < ApplicationController
  before_action :get_a_todo, only: [:show]
  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      flash[:notice] = "Please fill in!"
      redirect_to todos_path
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
    end

  def get_a_todo
    @todo = Todo.find(params[:id])
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
