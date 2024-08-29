# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should have_many(:posts) }

  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
end
