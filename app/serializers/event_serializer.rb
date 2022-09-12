# == Schema Information
#
# Table name: events
#
#  id          :uuid             not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class EventSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :description
  attributes :image

  has_many :tickets, serializer: TicketSerializer

  def image
    base_url + image_path if object.image.attached?
  end

  def image_path
    "/images/#{object.image.signed_id}"
  end

  def base_url
    Rails.application.routes.default_url_options[:host]
  end
end
