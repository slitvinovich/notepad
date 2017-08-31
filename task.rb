require 'date'

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "Wo working?"
    @text = gets.chomp

    puts "Termin? (dd.mm.yyyy)"
    input = gets.chomp

    @due_date = Date.parse(input)

  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"

    deadline = "Time X: #{@due_date}"

    return [deadline, @text, time_string]

  end
end