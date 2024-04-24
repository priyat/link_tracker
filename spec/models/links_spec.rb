require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'before_create' do
    it 'generates a tracking code before creation' do
      link = create(:link, tracking_code: nil)

      expect(link.tracking_code).to be_present
    end
  end
end
