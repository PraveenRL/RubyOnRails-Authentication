class UserMailer < ApplicationMailer

    def registration_confirmation
        @user = params[:user]
        mail(:to => "#{@user.firstname} <#{@user.email}>", subject: "Confirm Account")
    end

end
