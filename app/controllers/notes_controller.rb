class NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_noteable

    def create
        @note = @noteable.notes.build(note_params)  # Itt a build-et használjuk, nem a create-et
        @note.user = current_user  # A jegyzet készítője a jelenlegi felhasználó

        if @note.save  # A save a végső mentés az adatbázisba
          flash[:notice] = 'Note has been created!'
          redirect_to @noteable
        else
          flash[:alert] = 'Note has not been created!'  # Itt inkább alert használata a notice helyett
          redirect_to @noteable
        end
    end

    def destroy
       @note = @noteable.notes.find(params[:id])
       @note.destroy
       redirect_to @noteable
    end

    private
    
    def note_params
        params.require(:note).permit(:body)
    end
    def set_noteable
        @noteable = if params[:cow_id]
            Cow.find(params[:cow_id])
          elsif params[:field_id]
            Field.find(params[:field_id])
          end
    end
end
