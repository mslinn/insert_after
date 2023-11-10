require 'insert_after'

InsertAfter.insert_after 'line 2', 'New line from Ruby',     'my_file.txt'
InsertAfter.insert_after 'line',   'Another line from Ruby', 'my_file.txt', all: true
