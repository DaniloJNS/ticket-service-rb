# frozen_string_literal: true

module V1
  class TicketsController < ApplicationController
    def index
      tickets = Ticket.all

      if tickets.present?
        render json: TicketsSerializer.new(tickets).as_json, status: :ok
      else
        render status: :no_content
      end
    end
  end
end
