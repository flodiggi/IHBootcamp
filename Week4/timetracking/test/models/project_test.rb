require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "#clean_old removes projects older than a week" do
    old_project = Project.create(name: "test", description: "testsjsj")

    old_project.created_at = 2.years.ago

    new_project = Project.create(name: "test2", description: "jdjjd")

    Project.clean_old
    assert_equal new_project, Project.first
  end
end
