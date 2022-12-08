# Generate 10 articles 
10.times do 
    Article.create!(title:Faker::Lorem.sentence(word_count: 3),content: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4))
end

6.times do 
    Search.create!(query:'How are you today ?',user_ip:Faker::Internet.ip_v4_address)
    Search.create!(query:'How to fix this?',user_ip:Faker::Internet.ip_v4_address)
    Search.create!(query:'How to make a cake?',user_ip:Faker::Internet.ip_v4_address) 
end

