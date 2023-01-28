class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie_id = @movie.id
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find
    if @list.destroy
      redirect_path lists_path
    else
      render 'lists/index', status: :see_other
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
