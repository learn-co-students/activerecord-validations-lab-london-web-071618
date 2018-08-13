class MyValidator < ActiveModel::Validator
  def validate(record)
    if !record.title
      record.errors[:name] << 'Needs to have a title'
      return
    end

    title_requirements = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    included_phrases = title_requirements.select { |e| record.title.include? e  }

    if included_phrases.length == 0
      record.errors[:name] << 'Needs to be more clickbait-y!'
    end
  end
end

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "not a valid category"}
  include ActiveModel::Validations
  validates_with MyValidator

end
