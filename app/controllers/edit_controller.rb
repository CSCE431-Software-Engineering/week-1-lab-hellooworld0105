require 'uri'

class EditController < ApplicationController
    @@book = nil
    def editbook

        @title = params[:title]
        @urltitle = URI.encode_www_form_component("#{@title}")

        begin
            @book = Book.where(:title => @title)  
            @@book = @book
        rescue
            flash[:notice] = "Error Editing Book"
            redirect_to "/edit/#{@title}"
        end
    end

    def edit
        title = params[:newtitle]
        
        book = Book.where(:title => @@book[0]['title'])

        book.update(:title => title)
    
        if flash[:notice] 
            redirect_to "/edit/#{@@book[0]['title']}"
        else 
            flash[:notice] = "UPDATED book: #{@@book[0]['title']}"
            redirect_to '/'
        end
        
    end
end
