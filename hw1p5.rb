class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval %Q{
      def #{attr_name}=(value)
        if nil == @#{attr_name+'_history'} then
          @#{attr_name +'_history'} = [nil, value]
        else
          @#{attr_name +'_history'} << value
        end

        @#{attr_name} = value
      end
    }
  end
end
=begin
class Foo
  attr_accessor_with_history :bar
end
f = Foo.new
f.bar = 1
f.bar = 2
p f.bar_history
f = Foo.new
f.bar = 4
p f.bar_history
=end

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    elsif method_id.to_s == 'in'
      to_currency = args[0].to_s.gsub( /s$/, '')
      if @@currencies.has_key?(to_currency)
        self / @@currencies[to_currency]
      end
    else
      super
    end
  end
end

=begin
p 5.dollars.in(:euros)
p 10.euros.in(:rupees)
p 5.dollars
p 10.euros
=end

class String
  def palindrome?
    self.downcase.gsub(/\W/,"") == self.downcase.gsub(/\W/,"").reverse
  end
end

#p "foo".palindrome?


module Enumerable
  def palindrome?
    self == self.reverse_each.collect {|v| v}
  end
end


#p [1,2,3,2,1].palindrome?
#p [2, 3, 4,5,6].palindrome?
