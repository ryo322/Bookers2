class BooksController < ApplicationController
end

def show
  @book = Book.find(params[:id])
end 

def index 
  @books = Book.all
end
