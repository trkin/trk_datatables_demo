require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture posts
  end
end
