describe 'Home', type: :feature do
  it 'should have a search field' do
    visit root_path
    expect(page.find_field('query').value).to eq nil
  end

  it 'search field should have value if url query param exist' do
    visit '/?query=test'
    expect(page.find_field('query').value).to eq 'test'
  end

  it 'should get result if query is matching an article title' do
    visit '/'
    fill_in 'query', with: 'Hello'
    expect(page).to have_content('Hello World')
  end

  it 'should get result if query is matching an article title' do
    visit '/'
    fill_in 'query', with: 'Friend'
    expect(page).to have_content('Bye My Friend')
  end

  it 'should get No Results Found when nothing found in database' do
    visit '/?query=Im not anywhere in the database'
    expect(page).to have_content('No Results Found')
  end

  it 'should get No Results Found when nothing found in database' do
    visit '/?query=I should be in the database'
    recent = Search.last
    expect(recent.query).to eq('I should be in the database')
  end

  it 'should not replace the similar query because its shorter' do
    visit '/?query=I should be in the database'
    visit '/?query=I should be in '
    recent = Search.last
    expect(recent.query).to eq('I should be in the database')
  end

  it 'should only save the completed search' do
    visit '/?query=Testing a similar'
    visit '/?query=Testing a similar query '
    visit '/?query=Testing a similar query longer'
    recent = Search.last
    find_first_example = Search.where(query: 'Testing a similar')
    find_second_example = Search.where(query: 'Testing a similar query ')
    expect(find_second_example).to be_empty
    expect(find_first_example).to be_empty
    expect(recent.query).to eq('Testing a similar query longer')
  end
end
