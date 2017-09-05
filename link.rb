
class Link < Post

  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts "Link adress?"
    @url = gets.chomp

    puts "Wot is a link?"
    @text = gets.chomp

  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"

    return [@url, @text, time_string]

  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text,
            'url' => @url
        }
    )
  end

  def load_data(data_hash)
    super(data_hash) # сперва дёргаем родительский метод для иницилизации общих полей

    # теперь прописываем своё специфическое поле
    @url = data_hash['url']
  end
end