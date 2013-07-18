class Domain < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :domain_category_votes
  has_many :categories, through: :domain_category_votes

  attr_accessible :name

  def vote_sums
    @vote_sums ||= sort_out_vote_sums
  end

  def sort_out_vote_sums
    sums_of_votes = empty_vote_sums
    domain_category_votes.each do |vote|
      key = vote.vote ? :for : :against
      sums_of_votes[vote.category][key] += 1
      sums_of_votes[vote.category][:total] += 1
    end
    sums_of_votes
  end

  def empty_vote_sums
    all_categories = Category.all
    all_categories.each_with_object({}) do |category, vote_sums_by_category|
      vote_sums_by_category[category] = {
        :for =>  0,
        against: 0,
        total:   0
      }
    end
  end
end
