class SearchsController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @search_word = params[:word]
    @search_type = params[:search]
    @results_user, @results_book = User.looks(@search_type, @search_word), Book.looks(@search_type, @search_word)
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:seach], params[:word])
    else 
      @books = Book.looks(params[:seach], params[:word])
    end 
  end
end
