# Inspire's Ruby Style

[![CircleCI branch](https://img.shields.io/circleci/project/github/InspireNL/inspire-ruby-style/master.svg)](https://circleci.com/gh/InspireNL/inspire-ruby-style)

This gem packages [Inspire]'s [Rubocop] configuration so that it can easily be
used in multiple projects. Projects can inherit the global configuration, and
easily add or overwrite rules as necessary.

The gem additionally declares Rubocop as a dependency. Since different versions
of Rubocop have different default rules, it is important to run the same version
in all projects to achieve the same Ruby style. Nonetheless, projects can opt-in
to newer Rubocop versions by adding Rubocop as a dependency in their `Gemfile`
with the newer version. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem "inspire-ruby-style", github: "inspirenl/inspire-ruby-style", tag: "v3"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inspire-ruby-style

## Usage

After installing the gem, create a `.rubocop.yml` file in the project root with
the following contents:

```yaml
inherit_gem:
  inspire-ruby-style:
    - default.yml
```

Individual rules can be overwritten for each project as needed. For example, it
might make sense to disable the Rails rules for gems:

```yaml
Rails:
  Enabled: false
```

## Releases

This gem does **not** follow [SemVer](https://semver.org), since any change to
the style guide must be considered a breaking change. When making any changes to
the style guide, increase the version number in the `gemspec`.  

Document all changes in the `CHANGELOG`, so that it is easy to check if specific
rules need to be overwritten in a projec.t When changes to the guide are merged
into `master`, create a new release on GitHub and tag it with the new version
number.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

[inspire]: https://inspire.nl
[rubocop]: https://github.com/rubocop-hq/rubocop
