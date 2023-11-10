require 'fileutils'
require 'tempfile'
require_relative 'insert_after/version'

module InsertAfter
  def self.help(msg = nil)
    puts "Error: #{msg}\n\n" if msg
    puts <<~END_MSG
      Inserts a line into a file after a line matching a regular expression.
      String comparisons are case-insensitive.
      Works on very large files because it reads the file line by line instead of reading the entire file into memory.

      Can be used on the command line or in a Ruby program.

      Command line usage:
        # Inserts 'Inserted 1' after the first line containing 'line' into demo/my_file.txt:
        $ insert_after line 'Inserted 1' demo/my_file.txt

        # Inserts 'Inserted 1' after every line containing 'line' into demo/my_file.txt:
        $ insert_after -a line 'Inserted 1' demo/my_file.txt

        # Inserts an empty line after the first line containing 'line 1' into demo/my_file.txt:
        $ insert_after 'line 1' '' demo/my_file.txt

        # Inserts an empty line after every line containing 'line 1' into demo/my_file.txt:
        $ insert_after -a 'line 1' '' demo/my_file.txt

        # Inserts 'Inserted 2' after the first line starting with 'line 2' into demo/my_file.txt:
        $ insert_after '^line 2' 'Inserted 2' demo/my_file.txt

        # Inserts 'Inserted 2' after every line starting with 'line 2' into demo/my_file.txt:
        $ insert_after -a '^line 2' 'Inserted 2' demo/my_file.txt

        # Inserts 'Inserted 3' after the first line containing an 'e' followed by a '2' into demo/my_file.txt:
        $ insert_after 'e.*2' 'Inserted 3' demo/my_file.txt

        # Inserts 'Inserted 3' after every line containing an 'e' followed by a '2' into demo/my_file.txt:
        $ insert_after -a 'e.*2' 'Inserted 3' demo/my_file.txt

      Ruby usage:
        require 'insert_after'
        InsertAfter.insert_after 'line 2', 'New line', 'demo/my_file.txt'

        InsertAfter.insert_after 'line 2', 'New line', 'demo/my_file.txt', all: true
    END_MSG
    exit 1
  end

  def self.insert_after(regex, new_line, filename, all: false)
    InsertAfter.help "#{filename} does not exist" unless File.exist? filename

    original_file  = File.new(filename)
    temporary_file = Tempfile.new(filename)
    inserted = false
    begin
      original_file.each do |line|
        temporary_file << line
        if line.downcase.match?(/#{regex}/)
          temporary_file << "#{new_line}\n" unless inserted
          inserted = true unless all
        end
      end
      original_file.close
      temporary_file.close
      FileUtils.mv(temporary_file.path, filename)
    ensure
      original_file.close unless original_file.closed?
      temporary_file.close unless temporary_file.closed?
      temporary_file.unlink if File.exist? temporary_file.path
    end
  end

  def self.cmd(argv = ARGV)
    InsertAfter.help if argv.empty?
    if argv.include? '-a'
      all = true
      argv.delete '-a'
    end
    InsertAfter.help 'The new line to insert was not provided' if argv.length == 1
    InsertAfter.help 'No file name was provided' if argv.length == 2
    InsertAfter.help 'Too many arguments' if argv.length > 3
    regex    = argv[0].downcase
    new_line = argv[1].gsub('\n', "\n").gsub('\r', "\r").gsub('\t', "\t")
    filename = argv[2]
    InsertAfter.insert_after(regex, new_line, filename, all: all)
  end
end

InsertAfter.cmd(ARGV) if __FILE__ == $PROGRAM_NAME
