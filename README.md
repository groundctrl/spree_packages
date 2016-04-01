# SpreePackages

It does amazing stuff.

## Installation

#### Gem

Add the following to your Gemfile:

```
gem "spree_packages", github: "groundctrl/spree_packages"
```

#### Generators

Run the bundle command to install it:

```
bundle install
```

After installing, run the generator:

```
bundle exec rails g spree_packages:install
```

#### Rake

For existing variants that do not have dimensions associated to it, a Rake task can be run to add a default value to them.

```
bundle exec rake spree_packages:dimensions
```

> NOTE: This task has no effect on variants where dimensions have already been set. It only applies to variants where `height`, `width` or `depth` is `nil`

## Testing

Run tests. This will also generate the dummy app.

```
bundle exec rake
```

Or take the longer way around

```
bundle exec rake test_app
bundle exec rake spec
```

## Contributing

1. Fork it ( https://github.com/groundctrl/spree_packages/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
