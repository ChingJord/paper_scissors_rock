class PSR
  attr_writer :rand_seed

  def initialize(guess:)
    @guess = guess.downcase
  end

  def randomization_algorithm
    rand 234234
  end

  def computer_guess
    srand (@rand_seed || randomization_algorithm)
    computer_guesses = %w(paper scissors rock)
    computer_guesses.sample
  end

  def winner_is
    if rule_engine[computer_guess.to_sym].include? @guess
      "Computer wins"
    elsif rule_engine[@guess.to_sym].include? computer_guess
      "You win!"
    else
      "Tie"
    end
  end

  def rule_engine
    {
      'paper': ['rock'],
      'scissors': ['paper'],
      'rock': ['scissors']
    }
  end

end

