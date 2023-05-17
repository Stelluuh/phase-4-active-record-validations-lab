class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?


      # this is called Regexp: https://apidock.com/ruby/Regexp, https://www.rubyguides.com/2015/06/ruby-regex/
    
      def clickbait?
        unless title.present? &&
          (title.include?("Won't Believe") ||
           title.include?("Secret") ||
           title.match?(/\bTop \d+\b/) ||
           title.include?("Guess"))
          errors.add(:title, "must be clickbait")
        end
      end
end

#.none? returns whether no element is truthy
    # Link: https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-none-3F
#match: converts pattern to a Regexp, then invokes its match method on str. 