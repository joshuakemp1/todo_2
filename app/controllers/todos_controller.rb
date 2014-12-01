class TodosController < ApplicationController
  def index
    # @todo_array = ['Buy Milk', 'Buy Soap', 'Pay bill', 'Draw Money']
    @todo_items = Todo.all
    render :index
  end

  def destroy
    #put delete logic here
    @todo = Todo.last
    @todo.destroy
    redirect_to todos_delete_path
  end

  def add
    Todo.create(:todo_item => params[:todo_text])
    redirect_to :action => 'index'
  end


  # private

  # def todo_params
  #   params.require(:todo).permit(:todo_item)
  # end
end
