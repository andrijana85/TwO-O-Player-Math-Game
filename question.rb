class Question 
  attr_accessor :input1, :input2

  def generate_question
    @input1 = rand(1..20)
    @input2 = rand(1..20)
    "What does #{@input1} plus #{@input2} equal?"
  end

  def check_answer?(answer)
    answer == @input1 + @input2
  end
end