class PomodoroTimer
  attr_reader :type, :clock, :viewer
  def initialize(type)
    @type = type
  end

  def timerLength
    if @type == 'w'
      25 * 60
    elsif @type == 'r'
      6 
    end
  end

  def addViewer(viewer)
    @viewer = viewer
  end

  def notify
    viewer.printTimer
  end

  def start
    @clock = Time.at(timerLength)
    while @clock != Time.at(0)
      @clock -= 1
      sleep 1
      notify
    end
    @viewer.timerDone
  end

  def printTime
    puts @clock.strftime '%M:%S'
  end
end
