class UsersController < ApplicationController
    
    def index
        @users = User.customers.page(params[:page]).per(20)
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

    def update
        @user = User.find(session[:user_id])
        @user.assign_attributes(user_update_permit)
        if @user.save
            flash['info'] = "패스워드 변경에 성공했습니다."
            redirect_to user_edit_path
        else
            render :edit 
        end
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def toggle_active_user
        begin
            user = User.find(params[:user_id])
            user.active = !user.active
            user.save(validate: false)
            return redirect_to users_path
        rescue => e
            flash['error'] = '예상치 못한 오류'
            @users = User.all
            render :index            
        end
    end

    private 

    def user_permit
        params.require(:user).permit(:email, :password, :password_confirmation, :authority)
    end

    def user_update_permit
        params.require(:user).permit(:password, :password_confirmation)
    end
end
