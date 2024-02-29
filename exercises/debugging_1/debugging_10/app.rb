class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)

    begin
      unless valid?(api_key)
        raise AuthenticationError, 'API key is not valid.'
      end
    rescue AuthenticationError => e
      puts e.message
      exit! false
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1AXXX'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

      (positive * 100) / (positive + negative)
    rescue Exception
      NoScore
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)
def app
  puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
  return
  puts DoesItRock.find_out('Rain')        # Rain is not fun.
  puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!
end
app()

=begin
In order to test the case when authentication fails, we can simply set API_KEY to any string other than the correct key. Now, when using a wrong API key, we want our mock search engine to raise an AuthenticationError, and we want the find_out method to catch this error and print its error message API key is not valid.

Is this what you expect to happen given the code?

And why do we always get the following output instead?
=end
