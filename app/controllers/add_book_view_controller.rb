class AddBookViewController < ApplicationController
    def create
        title = params[:title]

        begin
            # create book in db
            Book.create(:title => title)
            flash[:notice] = "Created Book: #{title}"
            redirect_to '/'
        rescue
            flash[:notice] = "Error: Invalid Entry"
            redirect_to '/addbook'
        end
    end
end
