# frozen_string_literal: true

require_relative '../lib/time_manager'

describe TimeManager do
  # let(:times) {TimeManager.new([%w[10:00 10:20], %w[10:40 11:00], %w[11:50 12:00], %w[12:10 13:00], %w[10:00 10:20]])}

  it 'without intersections' do
    times = TimeManager.new([%w[10:00 10:20], %w[10:40 11:00], %w[11:50 12:00], %w[12:10 13:00], %w[10:00 10:20]])
    expect(times.free_time).to eq([%w[10:20 10:40], %w[11:00 11:50], %w[12:00 12:10]])
  end

  it 'with one intersection' do
    times = TimeManager.new([%w[10:00 10:20], %w[10:10 11:00], %w[11:50 12:00], %w[12:10 13:00], %w[10:00 10:20]])
    expect(times.free_time).to eq([%w[11:00 11:50], %w[12:00 12:10]])
  end

  it 'with chain of the intersection' do
    times = TimeManager.new([%w[10:00 10:20], %w[10:10 11:00], %w[11:00 12:00], %w[12:00 13:00], %w[10:00 10:20]])
    expect(times.free_time).to eq([])
  end

  it 'with intersection in middle' do
    times = TimeManager.new([%w[10:00 10:20], %w[10:40 11:00], %w[11:00 12:00], %w[12:30 13:00], %w[10:00 10:20]])
    expect(times.free_time).to eq([%w[10:20 10:40], %w[12:00 12:30]])
  end

  it 'first and last arent intersection' do
    times = TimeManager.new([%w[10:00 10:20], %w[10:40 11:00], %w[11:00 12:00], %w[12:00 13:00], %w[13:30 18:20]])
    expect(times.free_time).to eq([%w[10:20 10:40], %w[13:00 13:30]])
  end

  it 'fun sorted input array' do
    times = TimeManager.new([%w[10:00 10:20], %w[12:00 13:00], %w[10:40 11:00], %w[11:00 12:00], %w[13:30 18:20]])
    expect(times.free_time).to eq([%w[10:20 10:40], %w[13:00 13:30]])
  end
end
