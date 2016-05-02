puts "Seed file processing..."

print "Should generate topics..."

gewnerate_topics = ["Life Experience", "Programming Discussion", "Ruby Lang.", "Ruby on Rails", "Web Development"].each { |topic| Topic.create(title: topic) }

puts "Complete!"

print "Should generate articles..."

generate_articles = (1..10).each do |i|
	Article.create(
		title: "Article number : #{i}",
		content: "This is the content of the article #{i}",
		topic_id: rand(1..3)
	)
end

puts "Complete!"