require "application_system_test_case"

class EstoquePecasTest < ApplicationSystemTestCase
  setup do
    @estoque_peca = estoque_pecas(:one)
  end

  test "visiting the index" do
    visit estoque_pecas_url
    assert_selector "h1", text: "Estoque Pecas"
  end

  test "creating a Estoque peca" do
    visit estoque_pecas_url
    click_on "New Estoque Peca"

    click_on "Create Estoque peca"

    assert_text "Estoque peca was successfully created"
    click_on "Back"
  end

  test "updating a Estoque peca" do
    visit estoque_pecas_url
    click_on "Edit", match: :first

    click_on "Update Estoque peca"

    assert_text "Estoque peca was successfully updated"
    click_on "Back"
  end

  test "destroying a Estoque peca" do
    visit estoque_pecas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estoque peca was successfully destroyed"
  end
end
