require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'
require_relative 'tweet.rb'

puts 'Hi! i am your notepad. Version 2 + Sqlite'
puts 'Your post?'

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size

  choices.each_with_index {|type, index| puts "\t#{index}. #{type}"}

  choice = gets.chomp.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console

id = entry.save_to_db

puts "record saved, id = #{id}"