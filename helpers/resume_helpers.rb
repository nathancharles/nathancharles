def institution_title(name, link)
	return link_to name, link, :target => "_blank" if (link && link != "")
	name
end

def time_span(sd, ed)
	return "#{sd} - #{ed}" if (ed && ed != "")
	"#{sd} - current"
end
