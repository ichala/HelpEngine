

describe 'Articles', type: :feature do
  article = Article.new(title: 'test title',content:Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4))

  # validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  # # content must be present and 5 - 500 chars long
  # validates :content, presence: true, length: { minimum: 5, maximum: 500 }

  it 'Article title should be more than 5 chars' do
    article.title = '1234'
    expect(article).to_not be_valid
  end

  it 'Article title should be less than 100 chars' do
    article.title = Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 6)
    expect(article).to_not be_valid
  end

  it 'Article content should be more than 5 chars' do
    article.content = '1234'
    expect(article).to_not be_valid
  end

  it 'Article title should be less than 500 chars' do
    article.content = Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 6)
    expect(article).to_not be_valid
  end

  it 'Article content must exist' do
    article.content = nil
    expect(article).to_not be_valid
  end

  it 'Article title must exist' do
    article.title = nil
    expect(article).to_not be_valid
  end

  it 'Article should save' do
    article.title = 'test_title'
    article.content = 'This is some valid content'
    article.save
    expect(article).to be_valid
  end



end
