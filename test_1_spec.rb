require 'rspec'

# Write a module called 'WordHelper' and write code to make the following specs pass.

describe "WordHelper" do

  it "tally words in a string" do
    sample = "key tree cat mouse tree monkey"

    expected = {
      key: 1,
      tree: 2,
      cat: 1,
      mouse: 1,
      monkey: 1
    }

    expect(
      WordHelper.tally(sample)
    ).to eq(expected)
  end

  it "applies blacklist" do
    blacklist =  %{count before}
    phrase = "Don't couNt your Chickens before they Hatch"

    expected = "Don't ***** your Chickens ****** they Hatch"

    expect(
      WordHelper.filter(phrase, blacklist)
    ).to eq(expected)
  end

  it "creates link to user" do
    domain = "http://github.com/"
    message = "Hi @jack and @jill please review my commit."

    expected = "Hi <a href='http://github.com/jack'>@jack</a> and <a href='http://github.com/jill'>@jill</a> please review my commit."

    expect(
      WordHelper.link_to_users(message, domain)
    ).to eq(expected)
  end
end

# 1. Remove Car's explicit reference to Engine by using dependency injection.
# 2. Spec the Car class, in isolation.

class Car
  attr_reader :engine

  def engine
    @engine ||= Engine.new(4)
  end

  def move
    engine.accelerate
  end
end

class Engine
  attr_reader :cylinders

  def initialize(cylinders)
    @cylinders = cylinders
  end

  def accelerate

  end
end