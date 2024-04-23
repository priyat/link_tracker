class Link < ApplicationRecord
  before_create :generate_tracking_code

  private

  def generate_tracking_code
    self.tracking_code = SecureRandom.hex(4)
  end
end
