# `Insert_after` [![Gem Version](https://badge.fury.io/rb/insert_after.svg)](https://badge.fury.io/rb/insert_after)

Inserts a line in a file after a regex match.


## Installation

Either add this line to your application&rsquo;s `Gemfile`:

```ruby
gem 'insert_after'
```

... or add the following to your application&rsquo;s `.gemspec`:

```ruby
spec.add_dependency 'insert_after'
```

And then execute:

```shell
$ bundle
```


## Usage

```shell
$ insert_after /regex/ 'This is the inserted line'
```

## Development

After checking out this git repository, install dependencies by typing:

```shell
$ bin/setup
```

You should do the above before running Visual Studio Code.


### Run the Tests

```shell
$ bundle exec rake test
```


### Interactive Session

The following will allow you to experiment:

```shell
$ bin/console
```


### Local Installation

To install this gem onto your local machine, type:

```shell
$ bundle exec rake install
```


### To Release A New Version

To create a git tag for the new version, push git commits and tags,
and push the new version of the gem to https://rubygems.org, type:

```shell
$ bundle exec rake release
```


## Contributing

Bug reports and pull requests are welcome at https://github.com/mslinn/insert_after.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
