class SearchController < ApplicationController

  def search
    # p params[:key_words]
    # @found_board = nil
    @board = Board.where('name like ?', "%#{params[:key_words]}%").limit 3
    respond_to do |format|
      if @board.size > 0
        @found = true
        format.js
      else
        @found = false

        @board = Board.new(:name => params[:key_words])
        format.js
      end
    end
  end
end