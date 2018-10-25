require "application_system_test_case"

class ServidorsTest < ApplicationSystemTestCase
  setup do
    @servidor = servidors(:one)
  end

  test "visiting the index" do
    visit servidors_url
    assert_selector "h1", text: "Servidors"
  end

  test "creating a Servidor" do
    visit servidors_url
    click_on "New Servidor"

    fill_in "Cargo", with: @servidor.cargo
    fill_in "Coordenacao", with: @servidor.coordenacao
    fill_in "Email", with: @servidor.email
    fill_in "Funcao", with: @servidor.funcao
    fill_in "Nome", with: @servidor.nome
    fill_in "Siape", with: @servidor.siape
    fill_in "Telefone", with: @servidor.telefone
    click_on "Create Servidor"

    assert_text "Servidor was successfully created"
    click_on "Back"
  end

  test "updating a Servidor" do
    visit servidors_url
    click_on "Edit", match: :first

    fill_in "Cargo", with: @servidor.cargo
    fill_in "Coordenacao", with: @servidor.coordenacao
    fill_in "Email", with: @servidor.email
    fill_in "Funcao", with: @servidor.funcao
    fill_in "Nome", with: @servidor.nome
    fill_in "Siape", with: @servidor.siape
    fill_in "Telefone", with: @servidor.telefone
    click_on "Update Servidor"

    assert_text "Servidor was successfully updated"
    click_on "Back"
  end

  test "destroying a Servidor" do
    visit servidors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Servidor was successfully destroyed"
  end
end
