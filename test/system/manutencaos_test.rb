require "application_system_test_case"

class ManutencaosTest < ApplicationSystemTestCase
  setup do
    @manutencao = manutencaos(:one)
  end

  test "visiting the index" do
    visit manutencaos_url
    assert_selector "h1", text: "Manutencaos"
  end

  test "creating a Manutencao" do
    visit manutencaos_url
    click_on "New Manutencao"

    fill_in "Dataentrada", with: @manutencao.dataEntrada
    fill_in "Datasaida", with: @manutencao.dataSaida
    fill_in "Descricao", with: @manutencao.descricao
    fill_in "Numordem", with: @manutencao.numOrdem
    fill_in "Status", with: @manutencao.status
    click_on "Create Manutencao"

    assert_text "Manutencao was successfully created"
    click_on "Back"
  end

  test "updating a Manutencao" do
    visit manutencaos_url
    click_on "Edit", match: :first

    fill_in "Dataentrada", with: @manutencao.dataEntrada
    fill_in "Datasaida", with: @manutencao.dataSaida
    fill_in "Descricao", with: @manutencao.descricao
    fill_in "Numordem", with: @manutencao.numOrdem
    fill_in "Status", with: @manutencao.status
    click_on "Update Manutencao"

    assert_text "Manutencao was successfully updated"
    click_on "Back"
  end

  test "destroying a Manutencao" do
    visit manutencaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manutencao was successfully destroyed"
  end
end
