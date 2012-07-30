class CartesianProduct
  include Enumerable
  def initialize(first, second)
    @firstarray = first
    @secondarray = second
  end

  def each
    result = []
    return result if nil == @firstarray || nil == @secondarray
    return result if @firstarray.length == 0 || @secondarray.length == 0
    @firstarray.each do |item1|
      @secondarray.each do |item2|
        yield [item1, item2]
      end
    end
  end
end
=begin
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
=end

