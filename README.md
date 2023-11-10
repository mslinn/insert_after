# `Insert_after` [![Gem Version](https://badge.fury.io/rb/insert_after.svg)](https://badge.fury.io/rb/insert_after)

Inserts a line into a file after a line matching a regular expression.
String comparisons are case-insensitive.
Works on very large files because it reads the file line by line instead of reading the entire file into memory.

Can be used on the command line or in a Ruby program.


## Command-line Installation

```ruby
$ gem install insert_after
```


## Installation For Use In a Ruby Program

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


## Command-line Usage

```shell
# Inserts 'Inserted 1' after the first line containing 'line' into demo/my_file.txt:
$ insert_after line 'Inserted 1' demo/my_file.txt

# Inserts an empty line after the first line containing 'line 1' into demo/my_file.txt:
$ insert_after 'line 1' '' demo/my_file.txt

# Inserts 'Inserted 2' after the first line starting with 'line 2' into demo/my_file.txt:
$ insert_after '^line 2' 'Inserted 2' demo/my_file.txt

# Inserts 'Inserted 3' after the first line containing an 'e' followed by a '2' into demo/my_file.txt:
$ insert_after 'e.*2' 'Inserted 3' demo/my_file.txt
```


## Ruby Program Usage

The `demo/demo.rb` program is an example of how to use `insert_after` in a Ruby program:

```ruby
require 'insert_after'

InsertAfer.insert_after 'line 2', 'New line', 'my_file.txt'
```


## Development

After checking out this git repository, install dependencies by typing:

```shell
$ bin/setup
```

You should do the above before running Visual Studio Code.


### Run the Tests

```shell
$ bundle exec rspec
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
