require 'test_helper'

class PecasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @peca = pecas(:one)
  end

  test "should get index" do
    get pecas_url
    assert_response :success
  end

  test "should get new" do
    get new_peca_url
    assert_response :success
  end

  test "should create peca" do
    assert_difference('Peca.count') do
      post pecas_url, params: { peca: { caracteristica: @peca.caracteristica, nome: @peca.nome } }
    end

    assert_redirected_to peca_url(Peca.last)
  end

  test "should show peca" do
    get peca_url(@peca)
    assert_response :success
  end

  test "should get edit" do
    get edit_peca_url(@peca)
    assert_response :success
  end

  test "should update peca" do
    patch peca_url(@peca), params: { peca: { caracteristica: @peca.caracteristica, nome: @peca.nome } }
    assert_redirected_to peca_url(@peca)
  end

  test "should destroy peca" do
    assert_difference('Peca.count', -1) do
      delete peca_url(@peca)
    end

    assert_redirected_to pecas_url
  end
end
