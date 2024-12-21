require_relative 'lib/insert_after/version'

Gem::Specification.new do |spec|
  host = 'https://github.com/mslinn/insert_after'

  spec.authors               = ['Mike Slinn']
  spec.bindir                = 'exe'
  spec.description           = <<~END_DESC
    Inserts a line into a file after a line matching a regular expression.
    String comparisons are case-insensitive.
    Works on very large files because it reads the file line by line instead of reading the entire file into memory.

    Can be used on the command line or in a Ruby program.
  END_DESC
  spec.email                 = ['mslinn@mslinn.com']
  spec.executables           = ['insert_after']
  spec.files                 = Dir['LICENSE.*', 'Rakefile', '{exe,lib}/**/*', '*.gemspec', '*.md']
  spec.homepage              = 'https://github.com/mslinn/insert_after'
  spec.license               = 'MIT'
  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => "#{host}/issues",
    'changelog_uri'     => "#{host}/CHANGELOG.md",
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => host,
  }
  spec.name                  = 'insert_after'
  spec.platform              = Gem::Platform::RUBY
  spec.post_install_message  = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 2.6.0'
  spec.summary               = 'Inserts a line into a file after a line matching a regular expression.'
  spec.version               = InsertAfter::VERSION
end
