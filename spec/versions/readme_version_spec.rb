# frozen_string_literal: true

require "spec_helper"

RSpec.describe "README version" do
  subject(:version) { most_recent_tag }

  let(:readme) { Pathname.new(__dir__).join("..", "..", "README.md") }
  let(:regex) { %r{gem "inspire-ruby-style", github: "inspirenl/inspire-ruby-style", tag: "v([\d]+)"} }

  let(:most_recent_tag) do
    File.open(readme).each_line do |line|
      line.match(regex) { |tag| return tag[1] }
    end
  end

  it "matches the major version in the gemspec" do
    gem_version = Gem.loaded_specs["inspire-ruby-style"].version.version
    expect(version).to eq gem_version.split(".")[0]
  end
end
