class TodosController < ApplicationController
  def index
    # @todo_array = ['Buy Milk', 'Buy Soap', 'Pay bill', 'Draw Money']
    @todo_items = Todo.all
  end

  def delete
    #put delete logic here
    @todo_items = Todo.last
    @todo_items.destroy
  end

end
