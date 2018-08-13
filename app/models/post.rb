
class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    if record.title != nil && record.title.include?("Won't Believe" || "Secret" || "Top"|| "Guess") == false
      record.errors[:base] << "Not clickbaity enough."
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 20 }
  validates :content, length: { minimum: 50 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :summary, length: { maximum: 100 }
  validates_with ClickbaitValidator
end
