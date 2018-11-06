require 'test_helper'

class TermoCompromissosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @termo_compromisso = termo_compromissos(:one)
  end

  test "should get index" do
    get termo_compromissos_url
    assert_response :success
  end

  test "should get new" do
    get new_termo_compromisso_url
    assert_response :success
  end

  test "should create termo_compromisso" do
    assert_difference('TermoCompromisso.count') do
      post termo_compromissos_url, params: { termo_compromisso: { dataDevolucao: @termo_compromisso.dataDevolucao, dataVinculo: @termo_compromisso.dataVinculo } }
    end

    assert_redirected_to termo_compromisso_url(TermoCompromisso.last)
  end

  test "should show termo_compromisso" do
    get termo_compromisso_url(@termo_compromisso)
    assert_response :success
  end

  test "should get edit" do
    get edit_termo_compromisso_url(@termo_compromisso)
    assert_response :success
  end

  test "should update termo_compromisso" do
    patch termo_compromisso_url(@termo_compromisso), params: { termo_compromisso: { dataDevolucao: @termo_compromisso.dataDevolucao, dataVinculo: @termo_compromisso.dataVinculo } }
    assert_redirected_to termo_compromisso_url(@termo_compromisso)
  end

  test "should destroy termo_compromisso" do
    assert_difference('TermoCompromisso.count', -1) do
      delete termo_compromisso_url(@termo_compromisso)
    end

    assert_redirected_to termo_compromissos_url
  end
end
