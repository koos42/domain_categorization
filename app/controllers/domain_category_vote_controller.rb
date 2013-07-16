class DomainCategoryVoteController < ApplicationController
  before_filter :get_domain_and_category, only: [:vote_for, :vote_against]
  before_filter :get_voting_method

  def vote_for
    Vote.new(domain: @domain, category: @category, vote: true).save
  end

  def vote_against
    Vote.new(domain: @domain, category: @category, vote: false).save
  end

  private

  def get_domain_and_category
    @domain = Domain.find(domain: params[:domain])
    @category = Category.find(category: params[:category])
  end

  def get_voting_method
    @voting_method = params[:voting_method]
  end
end
