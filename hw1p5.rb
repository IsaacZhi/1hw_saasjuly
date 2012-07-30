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

class Numberic
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

