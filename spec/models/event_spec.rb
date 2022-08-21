require 'rails_helper'

RSpec.describe Event, type: :model do
  context "associations" do
    it { should have_many(:tickets) }
  end
end
