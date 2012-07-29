def combine_anagrams(words)
  result = []
  return result if nil == words
  words.each do |theword|
    nomatch = true
    thewordarray = theword.downcase.scan(/./).sort
    result.each_with_index do |item, index|
      if item[0].downcase.scan(/./).sort == thewordarray then
        nomatch = false
        result[index] << theword
        break
      end
    end
    result << [ theword ] if nomatch
  end
  result
end

#test = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
#p combine_anagrams(test)

