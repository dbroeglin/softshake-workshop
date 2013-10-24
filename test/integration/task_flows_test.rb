require 'test_helper'

class TaskFlowsTest < ActionDispatch::IntegrationTest
  test "new task creation has project selection" do
    p = projects(:one)

    visit(new_task_path())
    assert page.has_content?('New task')
    within("select[name='task[project_id]']") do
        option = find("option[value='#{p.id}']")
        assert_not option.nil?
        assert_equal p.title, option.text
    end
  end
end
