irbrc_path = File::expand_path("~/.irbrc")
if File.exist?(irbrc_path)
  load irbrc_path
end

if defined?(Rails) && Rails.env
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!
end
