class UsersController < ApplicationController

    skip_before_action :require_user, only: [:new, :create, :confirm_email]
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_same_student, only: [:edit, :update]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.with(user: @user).registration_confirmation.deliver_now
            flash[:success] = "Please confirm your email address to continue"
            redirect_to @user
        else
            flash[:error] = "Ooops, something went wrong"
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
            user.email_activate
            flash[:success] = "Your email has been confirmed. Please sign in to continue"
            redirect_to root_path
        else
            flash[:error] = "Sorry, User does not exist"
            redirect_to root_path
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def require_same_student
        if current_user != @student
            redirect_to root_path
        end
    end

end