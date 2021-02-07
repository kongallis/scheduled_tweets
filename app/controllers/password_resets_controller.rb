class PasswordResetsController < ApplicationController
    def new

    end

    def create
        if @user.present?
            #Send email
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "If an account with that email was found, we have sent you a link to reset your password"
    end
end