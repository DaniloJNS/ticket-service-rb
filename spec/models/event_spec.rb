# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  context "associations" do
    it { should have_many(:tickets) }
  end
end
