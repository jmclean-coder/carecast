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
            redirect_to stats_path
        else
            flash[:error_messages] = @metric.errors.full_messages
            render :new
        end
    end
#-----------------------------------------------CUSTOM ROUTE CONTROLLER

    # def today - WIP
    
    # end

    def weekly
        @avg_stats = {
            water: current_user.wk_avg_water,
            sleep: current_user.wk_avg_sleep,
            work_time: current_user.wk_avg_work_time,
            play_time: current_user.wk_avg_play_time,
            energy: current_user.wk_avg_energy,
            productivity: current_user.wk_avg_productivity,
            motivation: current_user.wk_avg_motivation,
            stress: current_user.wk_avg_stress,
            mood: current_user.wk_avg_mood
        }
    end

    def monthly
        @avg_stats = {
            water: current_user.mnth_avg_water,
            sleep: current_user.mnth_avg_sleep,
            work_time: current_user.mnth_avg_work_time,
            play_time: current_user.mnth_avg_play_time,
            energy: current_user.mnth_avg_energy,
            productivity: current_user.mnth_avg_productivity,
            motivation: current_user.mnth_avg_motivation,
            stress: current_user.mnth_avg_stress,
            mood: current_user.mnth_avg_mood
        }
    end


    
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
        @metric = Metric.find(params[:id])
    end
end
