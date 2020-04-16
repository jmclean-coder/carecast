class UsersController < ApplicationController
    before_action :redirect_user, only: [:show, :edit, :update, :destroy]
    before_action :current_user, only: [:show, :edit, :update, :destroy]
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            # byebug
            redirect_to @user
        else
            flash[:error_messages] = @user.errors.full_messages
            render :new
        end
    end
    
    def show
    end

    def edit
    end

    def update
        if @user.save
            @user.update(user_params)
            redirect_to @user
        else
            flash[:error_messages] = @user.errors.full_messages
            render :edit
        end
    end
    def destroy 
        @user.destroy
        reset_session
        redirect_to login_path
    end




    private

    def user_params
        params.require(:user).permit(:user_name, :name, :age, :birthday)
    end

    # def set_user
    #     @user = User.find(params[:id])
    # end
end
