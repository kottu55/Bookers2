class BooksController < ApplicationController

	def top
	end
	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book.id)
	end
	def new
		@books = Book.new
	end
	def show
		@newbook = Book.new
		@book = Book.find(params[:id])
		@user = current_user

	end
	def edit
	end
	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
		def book_params
			params.require(:book).permit(:title, :body, :user_id)
		end
end
