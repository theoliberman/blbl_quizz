require 'application_system_test_case'

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question = questions(:one)
  end

  test 'visiting the index' do
    visit questions_url
    assert_selector 'h1', text: 'Questions'
  end

  test 'creating a Question' do
    visit questions_url
    click_on 'New Question'

    fill_in 'A', with: @question.a
    fill_in 'Answer', with: @question.answer
    fill_in 'B', with: @question.b
    fill_in 'Body', with: @question.body
    fill_in 'C', with: @question.c
    fill_in 'D', with: @question.d
    fill_in 'Rank', with: @question.rank
    click_on 'Create Question'

    assert_text 'Question was successfully created'
    click_on 'Back'
  end

  test 'updating a Question' do
    visit questions_url
    click_on 'Edit', match: :first

    fill_in 'A', with: @question.a
    fill_in 'Answer', with: @question.answer
    fill_in 'B', with: @question.b
    fill_in 'Body', with: @question.body
    fill_in 'C', with: @question.c
    fill_in 'D', with: @question.d
    fill_in 'Rank', with: @question.rank
    click_on 'Update Question'

    assert_text 'Question was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Question' do
    visit questions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Question was successfully destroyed'
  end
end
