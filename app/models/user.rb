class User < ApplicationRecord
has_many :user_metrics, dependent: :destroy
has_many :metrics, through: :user_metrics
has_many :user_meals, dependent: :destroy
has_many :meals, through: :user_meals
has_many :journal_entries, dependent: :destroy 
has_many :journals, through: :journal_entries

#----------------------------------------------------Database Queries.

    def todays_metrics
        self.metrics.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
    end

    def weekly_metrics
        self.metrics.where(created_at: Date.current.all_week) 
    end

    def monthly_metrics
        self.metrics.where(created_at: Date.current.all_month) 
    end

#----------------------------------------------------Week Sums/Counts.

    
    def wk_water_sum
        self.weekly_metrics.map {|metric|
        metric.water_cup
    }.sum
    end

    def wk_water_count
        self.weekly_metrics.map {|metric|
        metric.water_cup
        }.count
    end


    def wk_sleep_sum
        self.weekly_metrics.map {|metric|
        metric.sleep_hour
    }.sum
    end

    def wk_sleep_count
        self.weekly_metrics.map {|metric|
        metric.sleep_hour
        }.count
    end

    def wk_work_time_sum
        self.weekly_metrics.map {|metric|
        metric.work_time
    }.sum
    end

    def wk_work_time_count
        self.weekly_metrics.map {|metric|
        metric.work_time
        }.count
    end

    def wk_play_time_sum
        self.weekly_metrics.map {|metric|
        metric.play_time
    }.sum
    end

    def wk_play_time_count
        self.weekly_metrics.map {|metric|
        metric.play_time
        }.count
    end

    def wk_energy_sum
        self.weekly_metrics.map {|metric|
        metric.energy
        }.sum
    end
    
    def wk_energy_count
        self.weekly_metrics.map {|metric|
        metric.energy
        }.count
    end

    def wk_productivity_sum
        self.weekly_metrics.map {|metric|
        metric.productivity
        }.sum
    end

    def wk_productivity_count
        self.weekly_metrics.map {|metric|
        metric.productivity
        }.count
    end

    def wk_motivation_sum
        self.weekly_metrics.map {|metric|
        metric.motivation
        }.sum
    end

    def wk_motivation_count
        self.weekly_metrics.map {|metric|
        metric.motivation
        }.count
    end

    def wk_stress_sum
        self.weekly_metrics.map {|metric|
        metric.stress
        }.sum
    end

    def wk_stress_count
        self.weekly_metrics.map {|metric|
        metric.stress
        }.count
    end

    def wk_mood_sum
        self.weekly_metrics.map {|metric|
        metric.productivity
        }.sum
    end

    def wk_mood_count
        self.weekly_metrics.map {|metric|
        metric.productivity
        }.count
    end
#----------------------------------------------------Week Averages.

    def wk_avg_play_time
        sum = self.wk_play_time_sum
         count = self.wk_play_time_count
         sum / count
    end

    def wk_avg_water
        sum = self.wk_water_sum
         count = self.wk_water_count
         sum / count
    end

    def wk_avg_sleep
        sum = self.wk_sleep_sum
         count = self.wk_sleep_count
         sum / count
    end
    
    def wk_avg_work_time
        sum = self.wk_work_time_sum
         count = self.wk_work_time_count
         sum / count
    end

    def wk_avg_mood
        sum = self.wk_mood_sum
        count = self.wk_mood_count
        sum / count
    end

    def wk_avg_stress
        sum = self.wk_stress_sum
        count = self.wk_stress_count
        sum / count
    end

    def wk_avg_productivity
        sum = self.wk_productivity_sum
        count = self.wk_productivity_count
        sum / count
    end

    def wk_avg_motivation
        sum = self.wk_motivation_sum
        count = self.wk_motivation_count
        sum / count
    end

    def wk_avg_energy
        sum = self.wk_energy_sum
        count = self.wk_energy_count
        sum / count
    end




#----------------------------------------------------Month Sums/Counts.
    def mnth_water_sum
        self.monthly_metrics.map {|metric|
        metric.water_cup
    }.sum
    end

    def mnth_sleep_sum
        self.monthly_metrics.map {|metric|
        metric.sleep_hour
    }.sum
    end

    def mnth_work_time_sum
        self.monthly_metrics.map {|metric|
        metric.work_time
    }.sum
    end

    def mnth_play_time_sum
        self.monthly_metrics.map {|metric|
        metric.play_time
    }.sum
    end

    def mnth_water_count
        self.monthly_metrics.map {|metric|
        metric.water_cup
        }.count
    end

    def mnth_sleep_count
        self.monthly_metrics.map {|metric|
        metric.sleep_hour
        }.count
    end

    def mnth_work_time_count
        self.monthly_metrics.map {|metric|
        metric.work_time
        }.count
    end

    def mnth_play_time_count
        self.monthly_metrics.map {|metric|
        metric.play_time
        }.count
    end

    def mnth_energy_sum
        self.monthly_metrics.map {|metric|
        metric.energy
        }.sum
    end
    
    def mnth_productivity_sum
        self.monthly_metrics.map {|metric|
        metric.productivity
        }.sum
    end

    def mnth_motivation_sum
        self.monthly_metrics.map {|metric|
        metric.motivation
        }.sum
    end

    def mnth_stress_sum
        self.monthly_metrics.map {|metric|
        metric.stress
        }.sum
    end

    def mnth_mood_sum
        self.monthly_metrics.map {|metric|
        metric.productivity
        }.sum
    end


    def mnth_motivation_count
        self.monthly_metrics.map {|metric|
        metric.motivation
        }.count
    end

    def mnth_stress_count
        self.monthly_metrics.map {|metric|
        metric.stress
        }.count
    end

    def mnth_mood_count
        self.monthly_metrics.map {|metric|
        metric.productivity
        }.count
    end

    def mnth_energy_count
        self.monthly_metrics.map {|metric|
        metric.energy
        }.count
    end

    def mnth_productivity_count
        self.monthly_metrics.map {|metric|
        metric.productivity
        }.count
    end

#----------------------------------------------------Month Avg.
    def mnth_avg_play_time
        sum = self.mnth_play_time_sum
        count = self.mnth_play_time_count
        sum / count
    end

    def mnth_avg_water
        sum = self.mnth_water_sum
        count = self.mnth_water_count
        sum / count
    end

    def mnth_avg_sleep
        sum = self.mnth_sleep_sum
        count = self.mnth_sleep_count
        sum / count
    end

    def mnth_avg_work_time
        sum = self.mnth_work_time_sum
        count = self.mnth_work_time_count
        sum / count
    end

    def mnth_avg_mood
        sum = self.mnth_mood_sum
        count = self.mnth_mood_count
        sum / count
    end

    def mnth_avg_stress
        sum = self.mnth_stress_sum
        count = self.mnth_stress_count
        sum / count
    end

    def mnth_avg_productivity
        sum = self.mnth_productivity_sum
        count = self.mnth_productivity_count
        sum / count
    end

    def mnth_avg_motivation
        sum = self.mnth_motivation_sum
        count = self.mnth_motivation_count
        sum / count
    end

    def mnth_avg_energy
        sum = self.mnth_energy_sum
        count = self.mnth_energy_count
        sum / count
    end

#----------------------------------------------------Day Sum
    def water_sum
        self.todays_metrics.map {|metric|
        metric.water_cup
    }.sum
    end

    def water_count
        self.todays_metrics.map {|metric|
        metric.water_cup
        }.count
    end


    def sleep_sum
        self.todays_metrics.map {|metric|
        metric.sleep_hour
    }.sum
    end

    def sleep_count
        self.todays_metrics.map {|metric|
        metric.sleep_hour
        }.count
    end

    def work_time_sum
        self.todays_metrics.map {|metric|
        metric.work_time
    }.sum
    end

    def work_time_count
        self.todays_metrics.map {|metric|
        metric.work_time
        }.count
    end

    def play_time_sum
        self.todays_metrics.map {|metric|
        metric.play_time
    }.sum
    end
    def play_time_count
        self.todays_metrics.map {|metric|
        metric.play_time
        }.count
    end

#----------------------------------------------------Day Avg

    def avg_play_time
        sum = self.play_time_sum
        count = self.play_time_count
        sum / count
    end

    def avg_water
        sum = self.water_sum
        count = self.water_count
        sum / count
    end

    def avg_sleep
        sum = self.sleep_sum
        count = self.sleep_count
        sum / count
    end

    def avg_work_time
        sum = self.work_time_sum
        count = self.work_time_count
        sum / count
    end
end
