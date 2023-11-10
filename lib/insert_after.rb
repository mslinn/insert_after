require 'fileutils'
require 'tempfile'
require_relative 'insert_after/version'

def help(msg=nil)
  puts "Error: #{msg}\n\n" if msg
  puts <<~END_MSG
    Inserts a line into a file after a line matching a regular expression.
    String comparisons are case-insensitive.
    Works on very large files because it reads the file line by line instead of reading the entire file into memory.

    Can be used on the command line or in a Ruby program.

    Command line usage:
      # Inserts 'Inserted 1' after the first line containing 'blah' into demo/my_file.txt:
      $ insert_after 1 'Inserted 1' demo/my_file.txt

      # Inserts an empty line after the first line containing 'line 1' into demo/my_file.txt:
      $ insert_after 'line 1' '' demo/my_file.txt

      # Inserts 'Inserted 2' after the first line starting with 'line 2' into demo/my_file.txt:
      $ insert_after '^line 2' 'Inserted 2' demo/my_file.txt

      # Inserts 'Inserted 3' after the first line containing an 'e' followed by a '2' into demo/my_file.txt:
      $ insert_after 'e.*2' 'Inserted 3' demo/my_file.txt

    Ruby usage:
      require 'insert_after'
      insert_after 'line 2' 'New line' 'demo/my_file.txt'
  END_MSG
  exit 1
end

help if ARGV.empty?
help 'The new line to insert was not provided' if ARGV.length == 1
help 'No file name was provided' if ARGV.length == 2
help 'Too many arguments' if ARGV.length > 3

regex    = ARGV[0].downcase
new_line = ARGV[1]
filename = ARGV[2]
help "#{filename} does not exist" unless File.exist? filename

original_file  = File.new(filename)
temporary_file = Tempfile.new(filename)
puts "Created #{temporary_file}"
begin
  original_file.each do |line|
    temporary_file << line
    temporary_file << "#{new_line}\n" if line.downcase.match?(/#{regex}/)
  end
  original_file.close
  temporary_file.close
  FileUtils.mv(temporary_file.path, filename)
ensure
  original_file.close unless original_file.closed?
  temporary_file.close unless temporary_file.closed?
  temporary_file.unlink if File.exist? temporary_file.path
end
