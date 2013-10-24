require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "add project to task" do
    task = Task.new(title: 'do it')
    task.project = projects(:one)
    task.save

    assert Task.find_by_project_id(projects(:one).id) == task
  end

  test "a new task should not be completed" do
    t = Task.new
    assert t.completed == false
  end

  test "title should be present"  do
    t = Task.create

    assert_match(/can't be blank/, t.errors[:title].first)
  end
end
