require 'test_helper'

class StudentPerformancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get student_performances_new_url
    assert_response :success
  end

end
