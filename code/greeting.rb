def greeting
  for name in 1..ARGV.length-1
    puts "#{ARGV[0]} #{ARGV[name]}"
  end
end
greeting