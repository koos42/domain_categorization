class DomainCategoryVotesController < ApplicationController
  before_filter :get_domain_and_category, only: [:vote_for, :vote_against]

  NUMBER_OF_DOMAINS = 9

  def index
    actions = %w[ is_it_a which_categories which_domians ]
    next_action = actions[rand(0..(actions.count - 1))]
    redirect_to action: next_action
  end

  # one domain to one category
  def is_it_a
    @domain = random_domains(1).first
    @category = random_category
    @domain_category_vote = DomainCategoryVote.new
  end

  # one domain to all categories
  def which_categories
    @domain = random_domains(1).first
    @categories = Category.all
    @domain_category_vote = DomainCategoryVote.new
  end

  # many domains, one category
  def which_domains
    @domains = random_domains
    @categories = [random_category]
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
    params['domain_category_vote'].each do |k,v|
      DomainCategoryVote.new(
        domain: Domain.find_by_id(v['domain']),
        category: Category.find_by_slug(v['category']),
        vote: v['vote']).save
    end
    redirect_to action: :which_categories
  end

  private

  def get_domain_and_category
    @domain = Domain.find_by_id(params[:domain_id])
    @category = Category.find_by_slug(params[:category_slug])
  end

  def random_domains(max_domains = NUMBER_OF_DOMAINS)
    Domain.order("RANDOM()").limit(max_domains)
  end

  def random_category
    Category.order("RANDOM()").first
  end
end
