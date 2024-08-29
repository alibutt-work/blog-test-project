# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  # Associations
  it { should belong_to(:post) }
  it { should belong_to(:user) }

  # Validations
  # You can add additional validation tests if needed, such as validating uniqueness
  # of a like per user per post if you have such a validation in place.
end
