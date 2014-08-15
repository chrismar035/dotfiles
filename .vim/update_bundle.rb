root_path = "#{Dir.pwd}/bundle"
Dir.entries(root_path). each do |dir|
  Dir.chdir("#{root_path}/#{dir}") do
    puts "Pulling latest for #{dir}"
    `git pull`
  end
end
