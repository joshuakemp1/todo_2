require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @todo_items = todos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

    test "should add a todo" do
    assert_difference('Todo.count') do
      post :add, todo: { todo_item: @todo_items.todo_item }
    end

    assert_redirected_to todo_path(assigns(:todo))
  end
end
