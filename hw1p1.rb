def palindrome?(string)
  return true if ( nil == string )
  prepareStr = string.downcase.gsub(/\W/, "")
  prepareStr.downcase == prepareStr.reverse
end

=begin
p true == palindrome?("A man, a plan, a canal -- Panama")
p true == palindrome?("Madam, I'm Adam!")
p false == palindrome?("Abracadabra")
p true == palindrome?(nil)
p true == palindrome?("")
=end

