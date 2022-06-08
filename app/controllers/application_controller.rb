class ApplicationController < ActionController::Base
    before_action :logined?

    def logined?
        if session[:user_id].blank?
            flash[:error] = '로그인이 필요합니다.'
            return redirect_to login_path
        end
    end

    def admin?
        user = User.find(session[:user_id])
        user.authority != 'Amin'
    end

    def customer?
        user = User.find(session[:user_id])
        user.authority != 'Customer'
    end

    def master?
        user = User.find(session[:user_id])
        user.authority != 'Master'
    end
end
