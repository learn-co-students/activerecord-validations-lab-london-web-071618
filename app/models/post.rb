class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  # validates_inclusion_of :title, {:in => ["Won't Believe", "Secret", "Top[number]", "Guess"] }
  validate :includes_clickbait?
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)

def includes_clickbait?
  array = ["Won't Believe", "Secret", "Top[number]", "Guess"]
  if title != nil && array.find {|clickbait| title.include?(clickbait)} == nil
    errors.add(:title, "needs to be more clickbaity")
  end
end

end
