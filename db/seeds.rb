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
    content: "Vous avez certainement déjà entendu parler du 'dark web', cet ensemble de sites inaccessibles depuis le Web classique, et qui nourrissent beaucoup de fantasmes - en particulier celui d’un vaste bazar, réservé aux initiés, dangereux et malsain, quelque part entre la série Mr Robot, les réseaux mafieux et les trafiquants de drogue. Mais la réalité est assez éloignée de cette image négative véhiculée par de nombreux médias.",
    question: "On continue toujours ?",
    html_content: "www.google.fr",
    position: 2,
    topic: topic
  )
  interaction_2.save!
  puts "Created #{interaction_2.content}"

   interaction_3 = Interaction.new(
    content: "Mais d’abord un petit point vocabulaire, pour éviter les confusions. Pour utiliser les bons termes, sachez qu’au coeur même d’Internet, existent plusieurs réseaux uniquement accessibles par des logiciels spécifiques : le “dark net”. Le contenu du Web qui se trouve sur ces réseaux - des sites volontairement “cachés” et difficiles à trouver - est appelé “dark web”. Ces services ne sont pas indexés par les moteurs de recherche : ils font aussi partie du “deep web”, la partie du Web qui englobe tous les sites dont il faut connaître l’adresse afin de s’y rendre - en gros, le Web qui existait avant Google, Lycos et Altavista.",
    question: "On continue toujours ?",
    html_content: "www.google.fr",
    position: 3,
    topic: topic
  )
  interaction_3.save!
  puts "Created #{interaction_2.content}"
#-------------------------------------
puts 'Creating 1 option...'
  option_1 = Option.new(
    title: "100% d'accord!",
    next_accroche: "Super ! J'aime ta bonne humeur",
    position: 1,
    interaction: interaction
  )
  option_1.save!

  option_2 = Option.new(
    title: "Bof !",
    next_accroche: "Tkt pas ca va bien se passer ! C'est pas si dur à comprendre. Beaucoup plus simple que JavaScript !",
    position: 2,
    interaction: interaction
  )
  option_2.save!

  option_3 = Option.new(
    title: "Pas tellement !",
    next_accroche: "Hoooooooooo :'( Mais non regarde, c'est hyper interessant!",
    position: 3,
    interaction: interaction
  )
  option_3.save!

  option_4 = Option.new(
    title: "Ouiiiiii !! :) ",
    next_accroche: "Trop bien !",
    position: 1,
    interaction: interaction_2
  )
  option_4.save!

  option_5 = Option.new(
    title: "C'est interessant mais.... !",
    next_accroche: "Tu pourras briller en société après ça, je t'assure !",
    position: 2,
    interaction: interaction_2
  )
  option_5.save!

  option_6 = Option.new(
    title: "Non vraiment arrete stp !",
    next_accroche: "Hooooo serieux ?! :'( Attends j'ai quand même un dernier truc à te dire!",
    position: 3,
    interaction: interaction_2
  )
  option_6.save!

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
