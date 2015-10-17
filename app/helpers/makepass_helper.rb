module MakepassHelper

  def get_password(count, args = {})
    # setting infomations
    length = string_to_integer(args[:length]) || 6
    use_upper = string_to_bool(args[:use_upper]) || false
    use_lower = string_to_bool(args[:use_lower]) || false
    use_number = string_to_bool(args[:use_number]) || false
    use_symbol = string_to_bool(args[:use_symbol]) || false

    # make wordset
    wordset = get_wordset(use_upper, use_lower, use_number, use_symbol)

    # make password
    passwords = []
    count.times do
      passwords << (0...length).map { wordset[rand(wordset.length)] }.join
    end
    return passwords
  end

  private

    def get_wordset(use_upper, use_lower, use_number, use_symbol)
      words = []
      words.concat ('A'..'Z').to_a if use_upper
      words.concat ('a'..'z').to_a if use_lower
      words.concat ('0'..'9').to_a if use_number
      words.concat  ('$'..'/').to_a if use_symbol
      # error check
      words.concat ('A'..'Z').to_a if words.empty?
      words
    end

    def string_to_bool param
      if param.class == String
        param = param.downcase == "true" ? true : false
      end
      return param
    end

    def string_to_integer param
      param = param.to_i
      if param == 0
        param = 6
      end
      return param
    end
end

