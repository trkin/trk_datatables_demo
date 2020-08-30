require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture comments
  end
end
