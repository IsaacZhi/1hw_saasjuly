def palindrome?(string)
  return true if ( nil == string )
  preprocessedStr = string.downcase.gsub(/\W/, "")
  preprocessedStr.downcase == preprocessedStr.reverse
end

=begin
p true == palindrome?("A man, a plan, a canal -- Panama")
p true == palindrome?("Madam, I'm Adam!")
p false == palindrome?("Abracadabra")
p true == palindrome?(nil)
p true == palindrome?("")
=end

def count_words(string)
  hash_map = Hash.new
  return hash_map if ( nil == string )
  string.downcase.gsub(/\w+/) do |word|
    if  hash_map.key?(word) then
      hash_map[word] += 1
    else
      hash_map[word] = 1
    end
  end
  hash_map
end

#p count_words("A man, a plan, a canal -- Panama")
#p count_words "Doo bee doo bee doo"
