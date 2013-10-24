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

  test "user can mark a task as done from the task list" do
    visit(tasks_path)
    within(first(:css, 'tbody tr')) do
      assert has_content?('false'), "should have false"
      click_on 'I did it'
    end
    within(first(:css, 'tbody tr')) do
      assert has_content?('true'), "should have true"
    end
  end
end
