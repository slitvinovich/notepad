
class Memo < Post

  def read_from_console
    puts "New post:"

    @text = []
    line = nil

    while line != "end" do
      line = gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"

    return @text.unshift(time_string)
  end
end