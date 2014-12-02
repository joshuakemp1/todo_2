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

  def complete
    params[:todos_checkbox].each do |check|
      todo_id = check
        t = Todo.find_by_id(todo_id)
      if t.completed == true
          t.update_attribute(:completed, false)
      else
       t.update_attribute(:completed, true)
      end
    end
    redirect_to :action => 'index'
  end


  # private

  # def todo_params
  #   params.require(:todo).permit(:todo_item)
  # end
end
