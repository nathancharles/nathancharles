def sluggify(string)
	string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end

def pretty_url(string)
  string.gsub(/^https?\:\/\//, '').gsub(/^www./, '').strip
end
