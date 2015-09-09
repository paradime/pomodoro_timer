puts 'Is this a work (w) or a rest (r) block?'
b = gets.chomp
limit = 5
label = ''
if b == 'w'
	limit = 25
	puts 'What are you working on?'
	label = gets.chomp
	puts 'Work hard!'
end
system('clear')
# Timing using countdown
clock = Time.at(limit * 60)
while clock != Time.at(0)
	clock -= 1
	sleep(1)
	system 'clear'
	puts clock.strftime "%M:%S"
end

# Timing using actual time
# start = Time.now
# total_time = Time.now - start
# while(total_time < (limit * 60))
# 	sleep(1)
# 	if total_time.to_i % 60 == 0
# 		puts "#{total_time.to_i / 60} minutes completed"
# 	end
# end
system("aplay /usr/share/sounds/alsa/beep.wav")
puts 'You finished your pomodoro!'
puts "You worked on: #{label}" unless label.empty?
