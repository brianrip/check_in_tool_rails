require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should have_many :playlist_activities }
end