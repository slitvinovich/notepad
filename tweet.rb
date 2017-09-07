require 'twitter'

class Tweet < Post

  @@CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = 'sKNOJeXV6GIA9z0RJtFeYV2Cn'
    config.consumer_secret = 'PcMLzAkrooivHjM1ZAqw0uudUOlju74c6HxQArA2tKT5YyphNz'
    config.access_token = '905283939597737986-jbNXHYUjn0xz1kvWinnun4urgKUJNcs'
    config.access_token_secret = '5IHwnsm7ns3hkO0jBDHMEPgldePBVbhnaKWcxlmKMX0YK'
  end

  def read_from_console
    puts "New tweet (up to 140 characters):"

    @text = gets.chomp[0..140]

    puts "send your tweet: #{@text}"
    @@CLIENT.update(@text)
    puts "tweet send"
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"

    return @text.unshift(time_string)
  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text
        }
    )
  end

  def load_data(data_hash)
    super(data_hash) # сперва дёргаем родительский метод для иницилизации общих полей

    # теперь прописываем своё специфическое поле
    @text = data_hash['text'].split('\n\r')
  end

end