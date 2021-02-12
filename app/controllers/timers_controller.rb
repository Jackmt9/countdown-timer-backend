class TimersController < ApplicationController
    before_action :authorized

    def index
        render json: @user.timers
    end

    # def show
    #     render json: Timers.find(params[:id])
    # end

    def destroy
        @timer = Timer.find(params[:id])
        @timer.destroy
        render json: { message: 'Timer successfully deleted.' }
    end

    def create
        @timer = Timer.create(time: params[:time], title: params[:title], user_id: @user.id)
        if (@timer.valid?)
            render json: @timer
        else
            render json: { message: 'Failed to create a new timer.' }
        end
    end

    # private

    # def timer_params
    #     params.require(:timer).permit(:time, :title)
    # end
end
