class Article < ApplicationRecord
  #title must be present and 5 - 100 chars long
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  #content must be present and 5 - 500 chars long
  validates :content, presence: true, length: { minimum: 5, maximum: 500 }
end
