class PomodoroLogger
  attr_reader :log_file
  FILE_NAME = 'pom_log.txt'

  def initialize
  end

  def write_task(task)
    @log_file = File.new(FILE_NAME, 'a+')
    @log_file.write("#{task}\n")
    @log_file.close
  end

  def get_last_item
    @log_file = File.new(FILE_NAME, 'a+')
    last_line = @log_file.readlines[-1]
    @log_file.close
    last_line
  end
end
