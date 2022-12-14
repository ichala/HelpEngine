class Search < ApplicationRecord
  # Accept only 5 - 100 chars long queries
  validates :query, presence: true, length: { minimum: 5, maximum: 100 }
  # user_ip must be present
  validates :user_ip, presence: true

  def similarity?(text, ip)
    Search.where('similarity(query, ?) > 0.4 AND user_ip= ?', text, ip).exists?
  end
end
