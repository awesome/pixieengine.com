class Visit < ActiveRecord::Base
  belongs_to :user

  def self.track(user, controller, action, session_id)
    Visit.create(:user => user, :controller => controller, :action => action, :session_id => session_id)
  end

  def self.daily_active_report
    Visit.select("COUNT(DISTINCT user_id) as count, date_trunc('day', created_at) AS day").group("date_trunc('day', created_at)").order("day")
  end
end
