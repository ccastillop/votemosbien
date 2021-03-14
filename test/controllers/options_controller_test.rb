require "test_helper"

class OptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option = options(:one)
  end

  test "should get index" do
    get options_url
    assert_response :success
  end

  test "should get new" do
    get new_option_url
    assert_response :success
  end

  test "should create option" do
    assert_difference('Option.count') do
      post options_url, params: { option: { description: @option.description, name: @option.name, question_id: @option.question_id, value_x: @option.value_x, value_y: @option.value_y } }
    end

    assert_redirected_to option_url(Option.last)
  end

  test "should show option" do
    get option_url(@option)
    assert_response :success
  end

  test "should get edit" do
    get edit_option_url(@option)
    assert_response :success
  end

  test "should update option" do
    patch option_url(@option), params: { option: { description: @option.description, name: @option.name, question_id: @option.question_id, value_x: @option.value_x, value_y: @option.value_y } }
    assert_redirected_to option_url(@option)
  end

  test "should destroy option" do
    assert_difference('Option.count', -1) do
      delete option_url(@option)
    end

    assert_redirected_to options_url
  end
end
