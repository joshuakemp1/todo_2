class TodosController < ApplicationController
  def index
    # @todo_array = ['Buy Milk', 'Buy Soap', 'Pay bill', 'Draw Money']
    @todo_items = Todo.all
    @new_todo = Todo.new
    render :index
  end

  def destroy
    #put delete logic here
    @todo = Todo.last
    @todo.destroy
    redirect_to todos_delete_path
  end

  def add
    todo = Todo.create(:todo_item => params[:todo][:todo_item])

    unless todo.valid?
        flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "Todo added successfully!"
      #set flash[:success] to "Todo added successfully"
    end
    redirect_to :action => 'index'
  end


  # private

  # def todo_params
  #   params.require(:todo).permit(:todo_item)
  # end
end
