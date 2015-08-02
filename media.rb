require "json"

class Media
  def initialize json
    @media_hash = JSON.parse json.downcase
  end

  def most_expensive count
    grouped_media = @media_hash
      .select { |e| e["type"] && e["price"]  }
      .group_by {|media_item| media_item["type"]}
    grouped_media.each { |k, v| grouped_media[k] = v
      .sort_by  { |item| -item["price"] }
      .first(count)  }
      grouped_media
  end

  def cd_runtime &lamda
    @media_hash
      .select {|e| e["type"] == "cd" && e["tracks"]}
      .each { |e| e["runtime"] = e["tracks"].map { |t| t["seconds"] || 0 }.reduce(:+) || 0 }
      .select { |e| lamda.call(e["runtime"])  }
  end

  def people_with_cd_and_book
    @media_hash
      .select { |e| e["author"]  }
      .group_by {|item| item["author"]}
      .select{|k, v| v.any? { |e| e["type"] == "cd"  } && v.any? { |e| e["type"] == "book" } }
      .map { |k, v| k.to_s }
  end

  def name_with_year
    year_reg_ex = /(^|\s)'\d{2}($|[\.,-\/#!$%\^&\*;:{}=\-_`~()\s])|(^|\s)[1-9]\d*($|[\.,-\/#!$%\^&\*;:{}=\-_`~()\s])/
    @media_hash
      .select { |e| year_reg_ex.match(e["title"]) ||
                    (e["tracks"] && e["tracks"].any? { |t| year_reg_ex.match(t["name"]) }) ||
                    (e["chapters"] && e["chapters"].any? { |c| year_reg_ex.match(c) } )}
  end
end
