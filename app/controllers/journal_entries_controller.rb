class JournalEntriesController < ApplicationController
    before_action :redirect_user
    before_action :set_entry, only: [:show, :edit, :update, :destroy]
    before_action :current_user
    def new
        @entry = JournalEntry.new
    end

    def create
        @entry = JournalEntry.new(entry_params)
        @entry.user_id = current_user.id
        if @entry.valid?
            @entry.save
            redirect_to @entry
        else
            flash[:error_messages] = @entry.errors.full_messages
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @entry.save
            @entry.update(entry_params)
            redirect_to @entry
        else
            flash[:error_messages] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @entry.destroy
        redirect_to journal_path
    end

    private
    def set_entry
        @entry = JournalEntry.find(params[:id])
    end

    def entry_params
        params.require(:journal_entry).permit(:title, :content, :journal_id)
    end
end
