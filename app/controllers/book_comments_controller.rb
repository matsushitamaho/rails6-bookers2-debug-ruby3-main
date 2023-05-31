class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    @book_comment = Book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    unless @book_comment.save
    #redirect_to request.referer
      render 'error'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
    #redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
