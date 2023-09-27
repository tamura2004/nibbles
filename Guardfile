guard :shell do
  watch /main.nbl|input.txt/ do |m|
    puts `cat input.txt | nibbles main.nbl`
  end
end
