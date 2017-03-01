require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["fiction", "non-fiction"]}
  validate :clickbait


  private
  def clickbait
    clickbait =[
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i,
  ]
    if clickbait.none?{ |word| word.match(title)}
      errors.add(:title, "must include clickbait")
    end
  end

end
