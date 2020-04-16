class MetricsController < ApplicationController
    before_action :redirect_user
    before_action :current_user

    def index
    end

    def new
        @metric = Metric.new
    end
    
    def create
        @metric = Metric.new(metric_params)
        if @metric.save
            @user_met = UserMetric.create(
                user_id: current_user.id, 
                metric_id: @metric.id
            )
            byebug
            redirect_to stats_path
        else
            flash[:error_messages] = @metric.errors.full_messages
            render :new
        end
    end
    #current_user.metrics.where(created_at: Date.today.all_week) 
    #metrics for a given user, for the week
    
    #current_user.metrics.where(created_at: Date.today)
    #metrics for a given user, created today

    #current_user.metrics.where(created_at: Date.yesterday)
    #metrics for a given user, created yesterday
    
    #current_user.metrics.where(created_at: Date.dayofweek)
    #metrics for a given user, created dayofweek

    # Metric.where(created_at: Date.today)
    # Metric.where(created_at: Date.today)



    private
    def metric_params
        params.require(:metric).permit(
            :water_cup, 
            :sleep_hour, 
            :work_time, 
            :play_time, 
            :energy, 
            :productivity,
            :motivation,
            :stress,
            :mood
        )
    end

    def set_metric
        @journal = Journal.find(params[:id])
    end
end
