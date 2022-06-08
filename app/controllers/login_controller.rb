class LoginController < ApplicationController
    
    skip_before_action :logined?

    def index
        if session[:user_id].present?
            flash[:error] =  '이미 로그인이되어있습니다.'
            return redirect_to home_path
        end 
        @user = User.new
    end

    def login
        @user = User.find_by(email: login_permit[:email])
        if @user.blank?
            @user = User.new
            return failure_login
        end

        return failure_login unless @user.authenticate(login_permit[:password_digest])
        add_session_date
        flash['error'] = ''
        flash['info'] = "#{@user.email}님 안녕하세요"
        redirect_to home_path
    end

    def logout
        session.delete(session[:user_id])
        flash['info'] = '성공적으로 로그아웃 하였습니다.'
        redirect_to login_path
    end
    
    private

    def failure_login
        flash[:error] =  '이메일 또는 비밀번호가 일치하지 않습니다'
        render :index 
    end

    def login_permit
        params.require(:user).permit(:email, :password_digest)
    end

    def add_session_date
        session[:user_id] = @user.id
    end
end
