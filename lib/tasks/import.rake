namespace :import do
  
  desc "Import Photos"
  task :photos, [:path] => [:environment] do |t, args|
    if (file_path = args[:path]).blank?
      puts "Error: file_path argument required."
      next
    end
    path = File.join(file_path)
    files = Dir.glob(path)
    ticker = 0
    if files.blank?
      puts "Error: no files found."
      next
    end
    files.each do |file|
      name = File.basename(file)
      if Photo.where(:file => name ).count >= 1
        puts "skipping: #{name}"
      else
        puts "Creating: #{name}"
        Photo.new(:file => File.open(file) ).save
      end
      # display progress
      if ticker % 20 == 0
        puts '-'*10
        puts "Processed: #{ticker} / #{files.count}"
        puts '-'*10
      end
      ticker = ticker + 1
    end
    
  end
  
end