class UsersController < ApplicationController
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_permit)
        if @user.save
            flash['info'] = "#{@user.email}를 생성하였습니다. 권한은 #{@user.authority}입니다"
            redirect_to home_path
        else
            render :new 
        end

    end

    def user_permit
        params.require(:user).permit(:email, :password_digest, :password_digest_confirmation, :authority)
    end
end
