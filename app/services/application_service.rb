# frozen_string_literal: true

class ApplicationService
  attr_reader :file_name

  def initialize(file_name:)
    @file_name = file_name
  end

  def self.execute(...)
    new(...).execute
  end
end
