def meta_canonical()
  path = current_page.path.split('.')[0]
  path = "" if path == "index"

  "http://www.nathancharles.net/" + path
end

def meta_title(title)
  return "Nathan Charles Cook | " + title if title
  "Nathan Charles Cook"
end
