# each
%w(hoge fuga piyo).each do |m|
  p m
end
# => "hoge" "fuga" "piyo"



# yield
def block_sample
  p "AAA"
  yield
  p "BBB"
end

block_sample do
  p "CCC"
end
# => "AAA" "CCC" "BBB"

def if_block_given
  p "hoge"
  yield if block_given?
  p "end"
end

if_block_given
# => "hoge" "end"

if_block_given do
  pp "BLOCK"
end
# => "hoge" "BLOCK" "end"

def yield_return
  p yield
end

yield_return do
  "ABCDEFG"
end
# => "ABCDEFG"

def yield_arg
  yield Time.now # ブロックの引数
end

yield_arg do |now|
  p now.year
end
# => 2019

def yield_arg_2
  yield Time.now, "ARG"
end
yield_arg_2 do |now, str|
  p now.year
  p str
end

def yield_default_arg
  yield
end

yield_default_arg do |a = "A"|
  p a
end

def yield_args
  yield 1, 2, 3
end

yield_args do |*a|
  p a
end

p "-------"

def block_call_sample(&block)
  p "AAA"
  block.call if block
  p "BBB"
end
block_call_sample
# => "AAA" "BBB"
block_call_sample do
  p "CCC"
end
# => "AAA" "CCC" "BBB"

e = %w(ZZZ XXX CCC)
block = Proc.new{|ee| p ee}
e.each &block
# => "ZZZ" "XXX" "CCC"

p1 = Proc.new {|val| val.upcase}
p2 = :upcase.to_proc
p p1.call('hi') # => HI
p p2.call('hi') # => HI


names = %w(taro hanako mike)
p names.map {|name| name.upcase} # => ["TARO", "HANAKO", "MIKE"]
p names.map(&:upcase) # => ["TARO", "HANAKO", "MIKE"]

