class ApplicationController < ActionController::Base
    before_action :logined?

    def logined?

        if session[:user_id].blank?
            flash[:error] = '로그인이 필요합니다.'
            return redirect_to login_path
        end
    end
end
