class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def list_params
    params.require(:bookmark).permit(:name)

  end
end
