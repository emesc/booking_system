require 'test_helper'

class SchoolLevelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get school_levels_show_url
    assert_response :success
  end

end
