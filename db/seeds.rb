# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all
Interaction.destroy_all
Option.destroy_all

puts 'Creating 1 fake topic...'

puts 'Creating 1 topic...'
  topic = Topic.new(
    title: "Onionland"
    first_accroche: "Ca vous interesse d'en savoir plus?"
    description: "Au programme, tout un univers à porté d'onion!"
  )
  topic.save!
  puts "Created #{topic.title}"

puts 'Creating 1 interaction...'
  interaction = Interaction.new(
    content: "interaction - content test"
    question: "On continue?"
    html_content: "www.lewagon.fr"
    topic_id: 1
    position: 1
  )
  interaction.save!
  puts "Created #{interaction.content}"

puts 'Creating 1 option...'
  option = Option.new(
    title: "100% d'accord!"
    next_accroche: "next accroche pour continuer"
    interaction_id: 1
    position: 1
  )
  option.save!
  puts "Created #{option.title}"


puts 'Finished!'
