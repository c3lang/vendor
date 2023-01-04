Dir.mkdir("temp") unless Dir.exist?("temp") 
list = []
Dir.each_child("libraries") do |lib|
  next unless lib.end_with?(".c3l")
  list << lib
end  


list.each do |lib|
  Dir.chdir("libraries/#{lib}")
  system("zip -r ../../temp/#{lib} * -x *.DS_Store")
  Dir.chdir("../..")
end