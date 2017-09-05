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

  def to_db_hash
    return super.merge(
    {
        'text' => @text,
        'due_date' => @due_date.to_s
    }
    )
  end

  def load_data(data_hash)
    super(data_hash) # сперва дёргаем родительский метод для иницилизации общих полей

    # теперь прописываем своё специфическое поле
    @due_date = Date.parse(data_hash['due_date'])
  end
end