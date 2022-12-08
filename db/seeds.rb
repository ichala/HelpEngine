# Generate 10 articles 
10.times do 
    Article.create!(title:Faker::Lorem.sentence(word_count: 3),content: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4))
end

