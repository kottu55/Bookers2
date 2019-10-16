class BooksController < ApplicationController
	before_action :authenticate_user!, only:[:index, :create, :show, :edit, :destroy]

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
		flash[:notice] = "You have creatad book successfully."
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
		@book = Book.find(params[:id])
	end
	def update
		book = Book.find(params[:id])
        book.update(book_params)
        redirect_to book_path(book.id)
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
