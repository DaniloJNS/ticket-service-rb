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
    Rails.application.routes.url_helpers.rails_blob_path(object.image) if object.image.present?
  end
end
