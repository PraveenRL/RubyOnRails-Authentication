class UsersController < ApplicationController

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
            redirect_to @user
        else
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