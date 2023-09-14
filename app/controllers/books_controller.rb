class BooksController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]
def new
  @book = Book.new
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book)
  else
   @books = Book.all
   @user = @book.user
   render 'books/index'
  end
end

def show
  @book = Book.find(params[:id])
  @user = @book.user
  @comment = Comment.new
end

def index
  @books = Book.all
  @book = Book.new
  @user = current_user
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    render 'books/edit'
  end
end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to '/books'
end

private
 def book_params
  params.require(:book).permit(:title, :body)
 end

 def is_matching_login_user
  @book = Book.find(params[:id])
  unless @book.user.id == current_user.id
    redirect_to '/books'
  end
 end
end