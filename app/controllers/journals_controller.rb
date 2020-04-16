class JournalsController < ApplicationController
    before_action :redirect_user
    before_action :current_user
    before_action :set_journal, only: [:show, :edit,:update, :destroy]

    def index
        @user_journals = @user.journals.uniq
    end
    
    
    def new
        @journal = Journal.new
    end

    def create
        @journal = Journal.new(journal_params)
        if @journal.valid?
            @user.journals << @journal
            @journal.save
            redirect_to journals_path
            flash[:message] = "Journal Created!"
        else
            flash[:error_messages] = @journal.errors.full_messages
            render :new
        end
    end


    def show
    end

    def edit
    end

    def update
        # byebug
        if @journal.save
            @journal.update(journal_params)
            redirect_to @journal
        else
            flash[:error_messages] = @journal.errors.full_messages
            render :edit
        end
    end


    def destroy
    @journal.destroy
    redirect_to journals_path
    end





    private
    def journal_params
        params.require(:journal).permit(:title, :description, :id)
    end

    def set_journal
        @journal = Journal.find(params[:id])
    end
end
