class GrammarStats
  def initialize
    @punctuation = [".", "?", "!"]
    @total_checks_true = 0
    @total_checks_false = 0
  end
  
  def check(text) 
    first_letter = text.chr
    last_letter = text.slice(-1).chr
      
    fl_result = (first_letter == first_letter.upcase ? true : false)
    ll_result = @punctuation.include?(last_letter)
    
    if fl_result == true && ll_result == true
      @total_checks_true += 1
      return true
    else 
      @total_checks_false += 1
      return false
    end
  end

  def total_checks
    return @total_checks_true + @total_checks_false
  end
  
  def percentage_good
    percentage =  (@total_checks_true.to_f / total_checks.to_f) * 100
    return percentage.ceil
  end



end

