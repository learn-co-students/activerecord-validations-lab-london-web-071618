class ClickbaitValidator < ActiveModel::Validator

  def validate(record)
    if record.title != nil && !record.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      record.errors[:title] << "Need a title from the following: Won't Believe, Secret, Top [number], or Guess"
    end
  end

end
