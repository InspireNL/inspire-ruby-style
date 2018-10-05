# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Gemspec version" do
  subject(:version) { Gem.loaded_specs["inspire-ruby-style"].version.version }

  it "matches the SemVer format" do
    expect(version).to match(/\A[\d]+\.[\d]+\.[\d]+\z/)
  end
end
