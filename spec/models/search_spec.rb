describe 'Searches', type: :feature do
  search = Search.new(query: Faker::Lorem.sentence(word_count: 3), user_ip: Faker::Internet.ip_v4_address)

  it 'query should be more than 3 chars' do
    search.query = '12'
    expect(search).to_not be_valid
  end

  it 'query should be less than 100 chars' do
    search.query = Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 6)
    expect(search).to_not be_valid
  end

  it 'query should exists' do
    search.query = nil
    expect(search).to_not be_valid
  end

  it 'user_ip should exist' do
    search.user_ip = nil
    expect(search).to_not be_valid
  end

  it 'should save search' do
    correct = Search.new
    correct.query = Faker::Lorem.sentence(word_count: 3)
    correct.user_ip = Faker::Internet.ip_v4_address
    correct.save
    expect(correct).to be_valid
  end

  it 'should not save search' do
    incorrect = Search.new
    incorrect.query = '12'
    incorrect.user_ip = nil
    incorrect.save
    expect(incorrect).to_not be_valid
  end
end
