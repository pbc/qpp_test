require 'spec_helper'

# 2. Spec the Car class, in isolation.

describe QppTest::Car do
  let(:engine) { double(accelerate: acceleration_result) }
  let(:acceleration_result) { "I have accelerated." }

  let(:car) { described_class.new(engine) }

  context "#move" do
    it "makes the car to accelerate" do
      expect(car.move).to eq acceleration_result
    end
  end
  
end