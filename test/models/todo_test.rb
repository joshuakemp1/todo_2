require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "Todo saves with all parameters" do
    todo = Todo.create(todo_item: 'Todo item', completed: 'Todo compete')
    assert todo.valid?, 'Todo did not save'
    assert_equal 'Todo item', todo.todo_item, 'Post title does not match'
  end
end
