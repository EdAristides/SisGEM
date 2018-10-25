require 'test_helper'

class EstoquePecasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estoque_peca = estoque_pecas(:one)
  end

  test "should get index" do
    get estoque_pecas_url
    assert_response :success
  end

  test "should get new" do
    get new_estoque_peca_url
    assert_response :success
  end

  test "should create estoque_peca" do
    assert_difference('EstoquePeca.count') do
      post estoque_pecas_url, params: { estoque_peca: {  } }
    end

    assert_redirected_to estoque_peca_url(EstoquePeca.last)
  end

  test "should show estoque_peca" do
    get estoque_peca_url(@estoque_peca)
    assert_response :success
  end

  test "should get edit" do
    get edit_estoque_peca_url(@estoque_peca)
    assert_response :success
  end

  test "should update estoque_peca" do
    patch estoque_peca_url(@estoque_peca), params: { estoque_peca: {  } }
    assert_redirected_to estoque_peca_url(@estoque_peca)
  end

  test "should destroy estoque_peca" do
    assert_difference('EstoquePeca.count', -1) do
      delete estoque_peca_url(@estoque_peca)
    end

    assert_redirected_to estoque_pecas_url
  end
end
