require 'test_helper'

class EquipamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipamento = equipamentos(:one)
  end

  test "should get index" do
    get equipamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_equipamento_url
    assert_response :success
  end

  test "should create equipamento" do
    assert_difference('Equipamento.count') do
      post equipamentos_url, params: { equipamento: { anoAquisicao: @equipamento.anoAquisicao, patrimonio: @equipamento.patrimonio, status: @equipamento.status } }
    end

    assert_redirected_to equipamento_url(Equipamento.last)
  end

  test "should show equipamento" do
    get equipamento_url(@equipamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipamento_url(@equipamento)
    assert_response :success
  end

  test "should update equipamento" do
    patch equipamento_url(@equipamento), params: { equipamento: { anoAquisicao: @equipamento.anoAquisicao, patrimonio: @equipamento.patrimonio, status: @equipamento.status } }
    assert_redirected_to equipamento_url(@equipamento)
  end

  test "should destroy equipamento" do
    assert_difference('Equipamento.count', -1) do
      delete equipamento_url(@equipamento)
    end

    assert_redirected_to equipamentos_url
  end
end
