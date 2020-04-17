class User < ApplicationRecord
has_many :user_metrics, dependent: :destroy
has_many :metrics, through: :user_metrics
has_many :user_meals, dependent: :destroy
has_many :meals, through: :user_meals
has_many :journal_entries, dependent: :destroy 
has_many :journals, through: :journal_entries

#----------------------------------------------------Database Queries.

    def todays_metrics
        self.metrics.where(created_at: Date.today)
    end

    def weekly_metrics
        self.metrics.where(created_at: Date.today.all_week) 
    end

    def monthly_metrics
        self.metrics.where(created_at: Date.today.all_month) 
    end

#----------------------------------------------------Week Sums.

    
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
#----------------------------------------------------Week Averages.

    def wk_avg_play
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



#----------------------------------------------------Month Sums.


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

#----------------------------------------------------Month Avg.
    def mnth_avg_play
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

    def avg_play
        sum = self.play_time_sum
        count = seplay_time_count
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


    # # water => value
    # # sleep => value
    # # work => value
    # # play => value

    # stat_hash = {}

    # user.weekly_metrics.m







end
