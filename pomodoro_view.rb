require_relative 'pomodoro_model'
class PomodoroView
  attr_reader :timer, :label
  def initialize
    run
  end

  def run
    puts 'is this a (w)ork or a (r)est block?'
    type = gets.chomp
    @timer = PomodoroTimer.new(type)
    if type == 'w'
      puts 'What are you working on?'
      @label = gets.chomp
      puts 'Good Luck!'
    end
    system('clear')
    @timer.addViewer(self)
    @timer.start
  end

  def printTimer
    system 'clear'
    @timer.printTime
  end

  def timerDone
    system('afplay ./OOT_Secret.wav')
    puts 'You finished your pomodoro!'
    puts "You worked on: #{@label}" unless @label.nil?
    run
  end
end

PomodoroView.new
