class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  CLICKBAIT_VALUES = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]

  def clickbait
    if CLICKBAIT_VALUES.none? {|bait| bait.match title}
      errors.add(:title, "Needs to be clickbait!")
    end
  end
end
