str = ''

(1..9).each do |x|
	(1..9).each do |y|
			str = str + 'node' + x.to_s + x.to_s + ' NotEqualTo ' + 'node' + x.to_s + y.to_s + "\n"
	end
end

File.open( "edges", 'w' ) do |my_file|
	my_file.puts str
end
