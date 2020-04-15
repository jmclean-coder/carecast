class LoginController < ApplicationController
    
    def new
    end

    def verify
        @user = User.find_by(user_name: params[:Username])
        if @user
            session[:user_id] = @user.id 
            redirect_to users_path
        else
            flash[:message] = "Login details invalid, please try again."
            render :new
        end
    end


end