class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit]
    before_action :current_user
    def index
    end

    def new
        @user = User.new
    end

    def create
        byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            # byebug
            redirect_to users_path
        else
            flash[:error_messages] = @user.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
    end
    
    
    def show
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :name, :age, :birthday)
    end
end
