class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  CLICKBAIT_VALUES = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]

  def clickbait
    if
      CLICKBAIT_VALUES.each do |bait|
      bait.match :title
      end
      errors.add(:title, "Needs to be clickbait!")
    end
    # if CLICKBAIT_VALUES.none? {|cb| cb.match title}
    #   errors.add(:title, "Must be clickbait")
    # end
  end
end
