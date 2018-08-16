class MyValidator < ActiveModel::Validator
  def validate(record)
      if record.title != nil && record.title.include?("Won't" || "Believe" || "Secret" || "Top"|| "Guess") == false
        record.errors[:title] << 'Need more clickbaity title!'
      end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 100 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction), message: "%{value} is not a valid category"}
    validates_with MyValidator
end


# validates :name, uniqueness: true, presence: true
# validates :phone_number, length: { is: 10 }
#
# create_table "posts", force: :cascade do |t|
#   t.string   "title"
#   t.text     "content"
#   t.text     "summary"
#   t.string   "category"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
