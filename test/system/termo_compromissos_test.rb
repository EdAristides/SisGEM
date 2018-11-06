require "application_system_test_case"

class TermoCompromissosTest < ApplicationSystemTestCase
  setup do
    @termo_compromisso = termo_compromissos(:one)
  end

  test "visiting the index" do
    visit termo_compromissos_url
    assert_selector "h1", text: "Termo Compromissos"
  end

  test "creating a Termo compromisso" do
    visit termo_compromissos_url
    click_on "New Termo Compromisso"

    fill_in "Datadevolucao", with: @termo_compromisso.dataDevolucao
    fill_in "Datavinculo", with: @termo_compromisso.dataVinculo
    click_on "Create Termo compromisso"

    assert_text "Termo compromisso was successfully created"
    click_on "Back"
  end

  test "updating a Termo compromisso" do
    visit termo_compromissos_url
    click_on "Edit", match: :first

    fill_in "Datadevolucao", with: @termo_compromisso.dataDevolucao
    fill_in "Datavinculo", with: @termo_compromisso.dataVinculo
    click_on "Update Termo compromisso"

    assert_text "Termo compromisso was successfully updated"
    click_on "Back"
  end

  test "destroying a Termo compromisso" do
    visit termo_compromissos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Termo compromisso was successfully destroyed"
  end
end
