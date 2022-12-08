describe 'Analytics', type: :feature do
  before(:each) do
    10.times do
      Search.create(
        query: Faker::Lorem.sentence(word_count: 3),
        user_ip: Faker::Internet.ip_v4_address
      )
    end
  end

  it 'should show Most Active User' do
    visit '/analytics'
    expect(page).to have_content('Most Active User')
  end

  it 'should show Last Query' do
    visit '/analytics'
    expect(page).to have_content('Last Query')
  end

  it 'should show Trending Searches' do
    visit '/analytics'
    expect(page).to have_content('Trending Searches')
  end

  it 'should show Searches Per Day' do
    visit '/analytics'
    expect(page).to have_content('Searches Per Day')
  end

  it 'should show Recent Searches by you' do
    visit '/analytics'
    expect(page).to have_content('Recent Searches by you')
  end
end
