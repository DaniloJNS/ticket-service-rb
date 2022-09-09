module V1
  class EventsController < ApplicationController
    def index
      @events = Event.all

      if @events.present?
        render json: @events, status: :ok
      else
        head :no_content
      end
    end
  end
end
