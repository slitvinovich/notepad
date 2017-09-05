
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

  def to_db_hash
    return super.merge(
        {
            'text' => @text.join('\n\r') #массив строк делаем одной большой строкой
        }
    )
  end

  def load_data(data_hash)
    super(data_hash) # сперва дёргаем родительский метод для иницилизации общих полей

    # теперь прописываем своё специфическое поле
    @text = data_hash['text'].split('\n\r')
  end

end