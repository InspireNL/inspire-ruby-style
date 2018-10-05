# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Changelog version" do
  def find_in_changelog(string)
    File.open(changelog).each_line do |line|
      return true if line.include? string
    end

    false
  end

  let(:changelog) { Pathname.new(__dir__).join("..", "..", "CHANGELOG.md") }

  let(:most_recent_tag) do
    File.open(changelog).each_line do |line|
      line.match(/\A## \[v([\d]+)\]/) { |tag| return tag[1] }
    end
  end

  subject(:version) { most_recent_tag }

  it "matches the major version in the gemspec" do
    gem_version = Gem.loaded_specs["inspire-ruby-style"].version.version
    expect(version).to eq gem_version.split(".")[0]
  end

  it "has a link to be compared with HEAD" do
    link = "https://github.com/InspireNL/inspire-ruby-style/compare/v#{version}...HEAD"
    match = find_in_changelog link

    expect(match).to be_truthy
  end

  it "has a link to be browsed" do
    link = "https://github.com/InspireNL/inspire-ruby-style/tree/v#{version}"
    match = find_in_changelog link

    expect(match).to be_truthy
  end
end
