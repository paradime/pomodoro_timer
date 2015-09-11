class PomodoroLogger
  attr_reader :log_file
  FILE_NAME = 'pom_log.txt'

  def initialize
    @log_file = File.new(FILE_NAME, 'a+')
  end

  def write_task(task)
    @log_file.write("Completed #{task} at #{Time.now}\n")
  end
end
