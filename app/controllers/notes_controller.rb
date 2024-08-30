class NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cow

    def create
        @note = @cow.notes.create(note_params)
        @note.user = current_user

     if @note.save 
        flash[:notice] = 'Note has been created!'
        redirect_to cow_path(@cow)
     else 
        flash[:notice] = 'Note has not been created!'
        redirect_to cow_path(@cow)
     end
    end

    def destroy
       @note = @cow.notes.find(params[:id])
       @note.destroy
       redirect_to cow_path(@cow) 
    end

    private
    
    def note_params
        params.require(:note).permit(:body)
    end
    def set_cow
        @cow = Cow.find(params[:cow_id])
    end
end
