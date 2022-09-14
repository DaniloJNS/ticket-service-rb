# frozen_string_literal: true

module V1
  class EventsController < ApplicationController
    before_action :find_event, only: %w[show]

    def index
      @events = Event.all

      if @events.present?
        render json: @events, status: :ok
      else
        head :no_content
      end
    end

    def show
      if @event.present?
        render json: @event, status: :ok
      else
        head :not_found
      end
    end

    def find_event
      @event = Event.find_by(id: params.require(:id))
    end
  end
end
