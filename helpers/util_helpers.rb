def sluggify(string)
	string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end