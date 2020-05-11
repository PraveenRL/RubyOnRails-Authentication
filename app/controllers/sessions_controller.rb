class SessionsController < ApplicationController

    skip_before_action :require_user, only: [:new, :create]

    def new
    end

    def create
        user = User.find_by(email: params[:sessions][:email].downcase)
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id] = user.id
            flash[:notice] = "Login successfully"
            redirect_to user
        else 
            flash.now[:notice] = "Invalid Credentials!"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end