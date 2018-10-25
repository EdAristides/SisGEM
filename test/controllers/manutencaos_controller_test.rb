require 'test_helper'

class ManutencaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manutencao = manutencaos(:one)
  end

  test "should get index" do
    get manutencaos_url
    assert_response :success
  end

  test "should get new" do
    get new_manutencao_url
    assert_response :success
  end

  test "should create manutencao" do
    assert_difference('Manutencao.count') do
      post manutencaos_url, params: { manutencao: { dataEntrada: @manutencao.dataEntrada, dataSaida: @manutencao.dataSaida, descricao: @manutencao.descricao, numOrdem: @manutencao.numOrdem, status: @manutencao.status } }
    end

    assert_redirected_to manutencao_url(Manutencao.last)
  end

  test "should show manutencao" do
    get manutencao_url(@manutencao)
    assert_response :success
  end

  test "should get edit" do
    get edit_manutencao_url(@manutencao)
    assert_response :success
  end

  test "should update manutencao" do
    patch manutencao_url(@manutencao), params: { manutencao: { dataEntrada: @manutencao.dataEntrada, dataSaida: @manutencao.dataSaida, descricao: @manutencao.descricao, numOrdem: @manutencao.numOrdem, status: @manutencao.status } }
    assert_redirected_to manutencao_url(@manutencao)
  end

  test "should destroy manutencao" do
    assert_difference('Manutencao.count', -1) do
      delete manutencao_url(@manutencao)
    end

    assert_redirected_to manutencaos_url
  end
end
