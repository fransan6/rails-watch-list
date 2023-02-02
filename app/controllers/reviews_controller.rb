class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])  # don't forget the list_id part
    @review.list = @list                 # forgot this bit too
    if @review.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new           # no idea what this is
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
