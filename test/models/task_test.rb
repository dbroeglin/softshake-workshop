require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "add project to task" do
    task = Task.new(title: 'do it')
    task.project = projects(:one)
    task.save

    assert Task.find_by_project_id(projects(:one).id) == task
  end
end
