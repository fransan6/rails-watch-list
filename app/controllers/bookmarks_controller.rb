class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])  # tfs
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])  # tfs
    @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.movie_id = @movie.id
    # @bookmark.list_id = @list.id
    @bookmark.list = @list  # taken from solution
    if @bookmark.save
      # redirect_to bookmark_path(@bookmark)
      redirect_to list_path(@list)  # taken from solution
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
