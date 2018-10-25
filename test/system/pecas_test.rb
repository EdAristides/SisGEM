require "application_system_test_case"

class PecasTest < ApplicationSystemTestCase
  setup do
    @peca = pecas(:one)
  end

  test "visiting the index" do
    visit pecas_url
    assert_selector "h1", text: "Pecas"
  end

  test "creating a Peca" do
    visit pecas_url
    click_on "New Peca"

    fill_in "Caracteristica", with: @peca.caracteristica
    fill_in "Nome", with: @peca.nome
    click_on "Create Peca"

    assert_text "Peca was successfully created"
    click_on "Back"
  end

  test "updating a Peca" do
    visit pecas_url
    click_on "Edit", match: :first

    fill_in "Caracteristica", with: @peca.caracteristica
    fill_in "Nome", with: @peca.nome
    click_on "Update Peca"

    assert_text "Peca was successfully updated"
    click_on "Back"
  end

  test "destroying a Peca" do
    visit pecas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Peca was successfully destroyed"
  end
end
