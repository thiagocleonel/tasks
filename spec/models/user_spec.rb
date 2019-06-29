require 'rails_helper'

RSpec.describe User, type: :model do
  it 'association has_many with tasks' do
    t = User.reflect_on_association(:tasks)
    expect(t.macro).to eq(:has_many)
  end
end
