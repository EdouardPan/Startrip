require 'test_helper'

class StarReviewsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get star_reviews_new_url
    assert_response :success
  end

  test "should get create" do
    get star_reviews_create_url
    assert_response :success
  end

end
