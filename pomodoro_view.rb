require_relative 'pomodoro_model'
require_relative 'pomodoro_logger'
class PomodoroView
  attr_reader :timer, :label, :logger
  def initialize
    logger = PomodoroLogger.new
    run
  end

  def run
    system 'clear'
    puts 'is this a (w)ork or a (r)est block? Ctrl+D to exit'
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
  rescue Interrupt => e
    run
  rescue NoMethodError => e
    system 'clear'
    puts 'Goodbye!'
  end

  def printTimer
    system 'clear'
    @timer.printTime
  end

  def timerDone
    system('afplay ./OOT_Secret.wav')
    puts 'You finished your pomodoro!'
    puts "You worked on: #{@label}" unless @label.nil?
    logger.write_task(@label)
    run
  end
end

PomodoroView.new
