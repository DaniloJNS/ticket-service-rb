# == Schema Information
#
# Table name: tickets
#
#  id              :bigint           not null, primary key
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  code            :string           not null
#  status          :integer          default(0)
#  ticketable_type :string           not null
#  ticketable_id   :bigint           not null
#
FactoryBot.define do
  factory :ticket do
    price { 1.5 }
  end
end
