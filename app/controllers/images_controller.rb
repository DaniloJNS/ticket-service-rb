# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :find_image, only: %w[show]

  def show
    return send_data @image.download, type: @image.content_type if @image.present?

    head :not_found
  end

  def find_image
    @image = ActiveStorage::Blob.find_signed(signed_id)
  end

  def signed_id
    @signed_id ||= params.require(:id)
  end
end
