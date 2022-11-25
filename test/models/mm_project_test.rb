require "test_helper"

class MmProjectTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  test 'it responds to #all' do
    all = MmProject.all
    assert all
  end

  test 'it responds to #first' do
    first = MmProject.first
    assert first
  end

  test 'it responds to #find' do
    id = MmProject.all.sample.id
    assert MmProject.find(id)
  end

  test 'it responds to #count' do
    count = MmProject.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = MmProject.where(idcc_number: '2642')
    assert where
    assert_not where.empty?
  end

  test 'it raises an error if wrong type in #where' do
    MmProject.where(idcc_number: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end
end