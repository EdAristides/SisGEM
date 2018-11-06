require "application_system_test_case"

class OcorrenciaTest < ApplicationSystemTestCase
  setup do
    @ocorrencium = ocorrencia(:one)
  end

  test "visiting the index" do
    visit ocorrencia_url
    assert_selector "h1", text: "Ocorrencia"
  end

  test "creating a Ocorrencium" do
    visit ocorrencia_url
    click_on "New Ocorrencium"

    fill_in "Dataocorrencia", with: @ocorrencium.dataOcorrencia
    fill_in "Tipo", with: @ocorrencium.tipo
    click_on "Create Ocorrencium"

    assert_text "Ocorrencium was successfully created"
    click_on "Back"
  end

  test "updating a Ocorrencium" do
    visit ocorrencia_url
    click_on "Edit", match: :first

    fill_in "Dataocorrencia", with: @ocorrencium.dataOcorrencia
    fill_in "Tipo", with: @ocorrencium.tipo
    click_on "Update Ocorrencium"

    assert_text "Ocorrencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Ocorrencium" do
    visit ocorrencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ocorrencium was successfully destroyed"
  end
end
