# frozen_string_literal: true

class Game
  def initialize
    @questions = %w[saya kamu makan minum meja kursi sepatu sendal roti]
    @score = 0
    @fail = 0
  end

  def play
    @questions.each do |question|
      puts "Tebak kata: #{random_question(question)}"
      answer_questions(question)
    end
  end

  private

  def answer_questions(question)
    print 'Jawab : '
    answer = gets.chomp
    if question.eql?(answer)
      @score += 1
      puts "BENAR point anda : #{@score}"
    else
      @fail += 1
      if @fail.eql?(3)
        puts 'Game Over. anda sudah salah 3 kali'
        exit
      end
      puts 'SALAH! Silakan coba lagi'
      answer_questions(question)
    end
  end

  def random_question(question)
    question.split('').shuffle.join
  end
end

game = Game.new
game.play
