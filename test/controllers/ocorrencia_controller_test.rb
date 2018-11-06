require 'test_helper'

class OcorrenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocorrencium = ocorrencia(:one)
  end

  test "should get index" do
    get ocorrencia_url
    assert_response :success
  end

  test "should get new" do
    get new_ocorrencium_url
    assert_response :success
  end

  test "should create ocorrencium" do
    assert_difference('Ocorrencium.count') do
      post ocorrencia_url, params: { ocorrencium: { dataOcorrencia: @ocorrencium.dataOcorrencia, tipo: @ocorrencium.tipo } }
    end

    assert_redirected_to ocorrencium_url(Ocorrencium.last)
  end

  test "should show ocorrencium" do
    get ocorrencium_url(@ocorrencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_ocorrencium_url(@ocorrencium)
    assert_response :success
  end

  test "should update ocorrencium" do
    patch ocorrencium_url(@ocorrencium), params: { ocorrencium: { dataOcorrencia: @ocorrencium.dataOcorrencia, tipo: @ocorrencium.tipo } }
    assert_redirected_to ocorrencium_url(@ocorrencium)
  end

  test "should destroy ocorrencium" do
    assert_difference('Ocorrencium.count', -1) do
      delete ocorrencium_url(@ocorrencium)
    end

    assert_redirected_to ocorrencia_url
  end
end
