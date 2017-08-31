require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'

puts 'Hi! i am your notepad.'
puts 'Your post?'

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size

  choices.each_with_index {|type, index| puts "\t#{index}. #{type}"}

  choice = gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console

entry.save

puts ""