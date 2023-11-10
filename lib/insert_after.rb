require_relative 'insert_after/version'

# Require all Ruby files in 'lib/', except this file
Dir[File.join(__dir__, '*.rb')].each do |file|
  require file unless file.end_with?('/insert_after.rb')
end

# Write the code for your gem here
