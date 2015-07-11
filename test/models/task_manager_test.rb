require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def test_it_creates_a_task
    2.times do
      create_task
    end

    task = TaskManager.find(TaskManager.all.first.id)

    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal task.id, task_id
  end

  def test_it_finds_all_tasks
    2.times do
      create_task
    end
    assert_equal 2, total_tasks
  end

  def test_it_finds_a_task_by_id
    2.times do
      create_task
    end
    assert_equal "a title", TaskManager.find(task_id).title
  end

  def test_it_updates_a_task
    task = create_task

    TaskManager.update(task.id, {title: "new title", description: "new desc"})

    assert_equal "new title", TaskManager.find(task.id).title
    assert_equal "new desc", TaskManager.find(task.id).description
  end

  def test_it_deletes_a_task
    2.times do
      create_task
    end

    total = total_tasks
    TaskManager.delete(task_id)
    assert_equal (total - 1), total_tasks
  end

  def create_task
    TaskManager.create({ :title       => "a title",
                          :description => "a description"})
  end

  def total_tasks
    TaskManager.all.count
  end

  def task_id
    TaskManager.all.first.id
  end
end