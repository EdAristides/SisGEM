require 'test_helper'

class ModelosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modelo = modelos(:one)
  end

  test "should get index" do
    get modelos_url
    assert_response :success
  end

  test "should get new" do
    get new_modelo_url
    assert_response :success
  end

  test "should create modelo" do
    assert_difference('Modelo.count') do
      post modelos_url, params: { modelo: { configuracao: @modelo.configuracao, marca: @modelo.marca, serial: @modelo.serial, tipo: @modelo.tipo, valor: @modelo.valor } }
    end

    assert_redirected_to modelo_url(Modelo.last)
  end

  test "should show modelo" do
    get modelo_url(@modelo)
    assert_response :success
  end

  test "should get edit" do
    get edit_modelo_url(@modelo)
    assert_response :success
  end

  test "should update modelo" do
    patch modelo_url(@modelo), params: { modelo: { configuracao: @modelo.configuracao, marca: @modelo.marca, serial: @modelo.serial, tipo: @modelo.tipo, valor: @modelo.valor } }
    assert_redirected_to modelo_url(@modelo)
  end

  test "should destroy modelo" do
    assert_difference('Modelo.count', -1) do
      delete modelo_url(@modelo)
    end

    assert_redirected_to modelos_url
  end
end
