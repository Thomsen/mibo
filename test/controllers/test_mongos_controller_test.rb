require 'test_helper'

class TestMongosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_mongo = test_mongos(:one)
  end

  # test "should get index" do
  #   get test_mongos_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_test_mongo_url
  #   assert_response :success
  # end

  # test "should create test_mongo" do
  #   assert_difference('TestMongo.count') do
  #     post test_mongos_url, params: { test_mongo: { name: @test_mongo.name } }
  #   end

  #   assert_redirected_to test_mongo_url(TestMongo.last)
  # end

  # test "should show test_mongo" do
  #   get test_mongo_url(@test_mongo)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_test_mongo_url(@test_mongo)
  #   assert_response :success
  # end

  # test "should update test_mongo" do
  #   patch test_mongo_url(@test_mongo), params: { test_mongo: { name: @test_mongo.name } }
  #   assert_redirected_to test_mongo_url(@test_mongo)
  # end

  # test "should destroy test_mongo" do
  #   assert_difference('TestMongo.count', -1) do
  #     delete test_mongo_url(@test_mongo)
  #   end

  #   assert_redirected_to test_mongos_url
  # end
end
