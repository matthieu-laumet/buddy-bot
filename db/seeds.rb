# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Answer.destroy_all
Schedule.destroy_all
Option.destroy_all
Interaction.destroy_all
Topic.destroy_all
User.destroy_all
Batch.destroy_all

puts 'Creating 1 fake topic...'
#-------------------------------------
puts 'Creating 1 batch...'
  batch = Batch.new(
    camp: 733
  )
  batch.save!
  puts "Created camp-#{batch.camp}"
#-------------------------------------
puts 'Creating 1 user...'
  user = User.new(
    first_name: "Melanie",
    last_name: "Couronne",
    batch: batch,
    admin: true,
    email: "mcouronne@gmail.com",
    password: "azerty"
  )
  user.save!
  puts "Created #{user.first_name}"
#-------------------------------------
puts 'Creating 1 topic...'
  topic = Topic.new(
    title: "Onionland",
    first_accroche: "Ca vous interesse d'en savoir plus?",
    description: "Au programme, tout un univers à porté d'onion!",
    user: user
  )
  topic.save!
  puts "Created #{topic.title}"
#-------------------------------------
puts 'Creating 1 interaction...'
  interaction = Interaction.new(
    content: "interaction - content test",
    question: "On continue?",
    html_content: "www.lewagon.fr",
    position: 1,
    topic: topic
  )
  interaction.save!
  puts "Created #{interaction.content}"
#-------------------------------------
puts 'Creating 1 option...'
  option = Option.new(
    title: "100% d'accord!",
    next_accroche: "next accroche pour continuer",
    position: 1,
    interaction: interaction
  )
  option.save!
  puts "Created #{option.title}"
#-------------------------------------
puts 'Creating 1 schedule...'
  schedule = Schedule.new(
    batch: batch,
    topic: topic,
    post_at: 2021-11-23
  )
  schedule.save!
  puts "Created #{schedule}"
#-------------------------------------
puts 'Creating 1 answer...'
  answer = Answer.new(
    option: option,
    user: user
  )
  answer.save!
  puts "Created #{answer}"
#-------------------------------------

puts 'Finished!'
