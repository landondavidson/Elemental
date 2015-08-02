require "yaml"
require_relative "media"

input = $stdin.read
media = Media.new input
print "5 Most Expensive Items per Category:\n"
print YAML::dump media.most_expensive(5)
print "CDs with a total runtime of more than 60 minutes:\n"
print YAML::dump media.cd_runtime{|time| time > 3600}
print "People who have released a book and CD:\n"
print YAML::dump media.people_with_cd_and_book
print "All Items with a Year in Title, Track Name or Chapter:\n"
print YAML::dump media.name_with_year
