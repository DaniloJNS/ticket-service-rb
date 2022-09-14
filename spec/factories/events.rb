# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :uuid             not null, primary key
#  description :text             not null
#  location    :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

#  id          :uuid             not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :event do
    name { FFaker.name }
    description { FFaker.name }
    location { FFaker.name }

    factory :event_with_tickets do
      transient do
        ticket_count { 1 }
      end

      after(:create) do |event, evaluator|
        create_list(:ticket, evaluator.ticket_count, ticketable: event)
      end
    end
  end
end
