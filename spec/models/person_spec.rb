require 'spec_helper'

describe Person, "Validations" do
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:full_name) }
end
