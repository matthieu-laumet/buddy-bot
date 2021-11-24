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
Post.destroy_all
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
    first_accroche: "Hello ! Je suis Captain Accroche ",
    description: "Au programme, tout un univers à porté d'onion!",
    user: user
  )
  topic.save!
  puts "Created #{topic.title}"
#-------------------------------------
puts 'Creating 1 interaction...'
  interaction = Interaction.new(
    content: "Au programme, tout un univers à porté d'onion! Un espace encore trop méconnu..",
    question: "Tu veux en savoir plus ?",
    html_content: "https://www.cnetfrance.fr/news/dark-web-comment-aller-sur-onion-land-et-ce-que-l-on-peut-y-trouver-39868394.htm",
    position: 1,
    topic: topic
  )
  interaction.save!
  puts "Created #{interaction.content}"

  interaction_2 = Interaction.new(
    content: "Vous avez certainement déjà entendu parler du “dark web”, cet ensemble de sites inaccessibles depuis le Web classique, et qui nourrissent beaucoup de fantasmes - en particulier celui d’un vaste bazar, réservé aux initiés, dangereux et malsain, quelque part entre la série Mr Robot, les réseaux mafieux et les trafiquants de drogue. Mais la réalité est assez éloignée de cette image négative véhiculée par de nombreux médias.",
    question: "On continue toujours ?",
    html_content: "www.google.fr",
    position: 2,
    topic: topic
  )
  interaction_2.save!
  puts "Created #{interaction_2.content}"
#-------------------------------------
puts 'Creating 1 option...'
  option_1 = Option.new(
    title: "100% d'accord!",
    next_accroche: "next accroche pour continuer",
    position: 1,
    interaction: interaction
  )
  option_1.save!

  option_2 = Option.new(
    title: "Bof !",
    next_accroche: "next accroche",
    position: 2,
    interaction: interaction
  )
  option_2.save!

  option_3 = Option.new(
    title: "Pas tellement !",
    next_accroche: "On arrete là !",
    position: 3,
    interaction: interaction
  )
  option_3.save!
  puts "Created #{option_1.title}, #{option_2.title} et #{option_3.title}"
#-------------------------------------
puts 'Creating 1 schedule...'
  schedule = Schedule.new(
    batch: batch,
    topic: topic,
    post_at: Date.today
  )
  schedule.save!
  puts "Created #{schedule}"
#-------------------------------------
puts 'Creating 1 answer...'
  answer = Answer.new(
    option: option_1,
    user: user
  )
  answer.save!
  puts "Created #{answer}"
#-------------------------------------
puts 'Creating 1 post...'
  post_1 = Post.new(
    user: user,
    buddy: true,
    form: false,
    interaction: interaction,
    content: interaction.topic.first_accroche
    )
    post_1.save!

    post_2 = Post.new(
    user: user,
    buddy: true,
    form: false,
    interaction: interaction,
    content: interaction.content
    )
    post_2.save!

    post_3 = Post.new(
    user: user,
    buddy: true,
    form: false,
    interaction: interaction,
    content: interaction.question
    )
    post_3.save!

    # options = []

    # interaction.options.each do |option|
    #   options << option.title
    # end

    post_4 = Post.new(
    user: user,
    buddy: true,
    form: true,
    interaction: interaction,
    content: ""
    )
    # content: options.join(', ')
    # )
    post_4.save!

puts 'Finished!'
