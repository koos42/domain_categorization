class DomainCategoryVotesController < ApplicationController
  before_filter :get_domain_and_category, only: [:vote_for, :vote_against]
  before_filter :get_voting_method

  NUMBER_OF_DOMAINS = 9

  def index
    redirect_to action: :is_it_a
  end

  def is_it_a
    @domain = random_domain 1
    @category = random_category
    @domain_category_vote = DomainCategoryVote.new
  end

  def which_categories
    @domain = random_domain 1
    @categories = Category.all
    @domain_category_vote = DomainCategoryVote.new
  end

  def which_domains
    @domains = random_domains
    @category = random_category
    @domain_category_vote = DomainCategoryVote.new
  end

  def vote_for
    DomainCategoryVote.new(domain: @domain, category: @category, vote: true).save
    redirect_to action: :is_it_a
  end

  def vote_against
    DomainCategoryVote.new(domain: @domain, category: @category, vote: false).save
    redirect_to action: :is_it_a
  end

  def votes_for
  end

  private

  def get_domain_and_category
    @domain = Domain.find_by_id(params[:domain_id])
    @category = Category.find_by_slug(params[:category_slug])
  end

  def get_voting_method
    @voting_method = params[:voting_method]
  end

  def random_domain(max_domains = NUMBER_OF_DOMAINS)
    Domain.order("RANDOM()").first
  end

  def random_category
    Category.order("RANDOM()").first
  end
end
