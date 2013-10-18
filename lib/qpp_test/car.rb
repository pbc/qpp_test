module QppTest
  class Car
    attr_reader :engine

    def engine
      @engine ||= Engine.new(4)
    end

    def move
      engine.accelerate
    end
  end
end