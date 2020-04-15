class JournalsController < ApplicationController
    before_action :current_user
    def new
        @journal = Journal.new
    end

    def create
        @journal = Journal.new(journal_params)
        if @journal.save
            redirect_to journals_path
        else
            flash[:error_messages] = @journal.errors.full_messages
            render :new
        end
    end

    def index
        @user_journals = @user.journals
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def journal_params
        params.require(:journal).permit(:title)
    end

    def set_journal
        @journal = Journal.find(params[:id])
    end
end
