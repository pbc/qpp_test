require 'spec_helper'

# Write a module called 'WordHelper' and write code to make the following specs pass.

describe QppTest::WordHelper do

  context "#tally" do
    let(:text_sample) { "key tree cat mouse tree monkey" }

    let(:expected_result) {
      {
        key: 1,
        tree: 2,
        cat: 1,
        mouse: 1,
        monkey: 1
      }
    }

    it "tally words in a string" do
      expect(
        described_class.tally(text_sample)
      ).to eq(expected_result)
    end
  end

  context "#filter" do
    let(:blacklist) { %{count before} }
    let(:phrase) { "Don't couNt your Chickens before they Hatch" }

    let(:expected_result) { "Don't ***** your Chickens ****** they Hatch" }
    
    it "applies blacklist" do
      expect(
        described_class.filter(phrase, blacklist)
      ).to eq(expected_result)
    end
  end

  context "#link_to_users" do    
    let(:domain) { "http://github.com/" }
    let(:message) { "Hi @jack and @jill please review my commit." }

    let(:expected_result) { "Hi <a href='http://github.com/jack'>@jack</a> and <a href='http://github.com/jill'>@jill</a> please review my commit." }
    
    it "creates link to user" do

      expect(
        described_class.link_to_users(message, domain)
      ).to eq(expected_result)
    end
  end

end
