require File.expand_path('../../minitest_helper', __FILE__)
require 'ostruct'
require 'minitest/spec'

describe ApiVersion do
  it 'defaults to v1 when no version info provided' do
    request = OpenStruct.new({:headers => {'Accept' => '*/*'}})
    ApiVersion.new(1).matches?(request).wont_equal(false)
  end

  it 'defaults to v1 for unversioned request' do
    request = OpenStruct.new({:headers => {'Accept' => 'application/vnd.rails_app'}})
    ApiVersion.new(1).matches?(request).wont_equal(false)
  end

  it 'matches versioned request' do
    request = OpenStruct.new({:headers => {'Accept' => 'application/vnd.rails_app-v123'}})
    ApiVersion.new(123).matches?(request).wont_equal(false)
  end
end
