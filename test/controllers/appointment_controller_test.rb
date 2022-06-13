require 'test_helper'

class AppointmentControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get appointment_index_url
    assert_response :success
  end

  test 'should get create' do
    get appointment_create_url
    assert_response :success
  end

  test 'should get update' do
    get appointment_update_url
    assert_response :success
  end

  test 'should get delete' do
    get appointment_delete_url
    assert_response :success
  end
end
