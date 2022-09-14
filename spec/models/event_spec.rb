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
require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'associations' do
    it { should have_many(:tickets) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:location) }
  end
end
