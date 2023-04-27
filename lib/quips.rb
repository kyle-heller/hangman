# frozen_string_literal: true

module Quips

  def self.intro
    logo = '

      ██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗
      ██║  ██║██╔══██╗████╗  ██║██╔════╝ ████╗ ████║██╔══██╗████╗  ██║
      ███████║███████║██╔██╗ ██║██║  ███╗██╔████╔██║███████║██╔██╗ ██║
      ██╔══██║██╔══██║██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║
      ██║  ██║██║  ██║██║ ╚████║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║
      ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
         _____ __       _ __                ____             __   __
        / ___// /______(_) /_____  _____   / __ )____ ______/ /__/ /
        \__ \/ __/ ___/ / //_/ _ \/ ___/  / __  / __ `/ ___/ //_/ /
       ___/ / /_/ /  / / ,< /  __(__  )  / /_/ / /_/ / /__/ ,< /_/
      /____/\__/_/  /_/_/|_|\___/____/  /_____/\__,_/\___/_/|_(_)
    '.red

    puts logo
    puts "
    Welcome to 'Reverse Hangman: The Hangman Strikes Back!' In this whimsical twist 
    on the classic game, you'll be playing as the hangman himself, tasked with 
    capturing and hanging your elusive prey. But beware, they won't go down without 
    a fight! As you guess correct letters, you'll slowly close in on your victim, 
    while incorrect guesses will give them a chance to escape. Can you catch them 
    before it's too late? It's time to find out!

    You can save at any time by entering SAVE or load a previous save by entering LOAD.

    Guess any letter by typing it into the console.\n\n".cyan
  end

  SUCCESS_QUIPS = [
    "'You're really getting the hang of this, aren't you?'",
    "'Looks like you've got the executioner's touch.'",
    "'You're getting closer to your victim's final moments.'",
    "'That's it, slowly but surely tightening the noose.'",
    "'Impressive, you're really playing up the 'hang' in hangman.'",
    "'Yes, another step closer to delivering justice, hangman style.'",
    "'That's the way to do it, it won't be long now.'",
    "'Excellent guess, the end is near for your unfortunate victim.'"
  ]
  
  FAILURE_QUIPS = [
    "'Looks like you're getting closer to the end. Just when all seemed lost, 
    Indiana Jones swung in and started to snatch them from the jaws of defeat!'",
    "'Oh no, you're making progress towards failure. Out of nowhere, Mr. Miyagi 
    appeared and started to save the day with his legendary karate skills!'",
    "'Uh oh, things are not looking good. In a daring move, the crew of the 
    Millennium Falcon started to swoop in and whisk them away to safety!'",
    "'With seconds to spare, a mysterious figure in a black cloak appeared and 
    started to whisk them away to safety with a swish of their wand!'",
    "'You're getting closer to failure. Just when all seemed lost, a wizard on a 
    giant bald eagle swooped down and started to carry them away to safety!'",
    "'Things are not looking good. As the hangman's axe was about to fall, a 
    high-pitched whistle pierced the air and a DeLorean time machine appeared, 
    starting to whisk them away to another era!'",
    "'As the noose started to tighten, a group of friendly extraterrestrials 
    descended from the sky and started to teleport them to safety aboard their spaceship!'",
    "'Just when they thought it was all over, a pack of loyal dogs burst through 
    the door and started to chase the executioner away!'",
    "'As the hangman's noose started to tighten, Buffy burst through the door and started 
    to take out the executioner with a roundhouse kick, quipping 'Looks like you're the 
    one who's about to get hung up!''",
    "'You're making progress towards defeat. As the trapdoor started to open beneath them, 
    the Avengers swooped in and started to snatch them from the clutches of death, quipping 
    'Looks like we just saved the world...again.''",
    "'Things are not looking good. Just when they thought it was over, the Ghostbusters 
    blasted through the door and started to zap the executioner with their proton packs!'",
    "'You're getting closer to failure. As the executioner started to raise his axe, a swarm 
    of bees descended from the sky and started to chase him away, buzzing 'Not today, buddy!''",
    "'With the noose around their neck, a mysterious dark figure in a cape and cowl appeared and 
    started to take out the executioner with a batarang!'",
    "'Just as all seemed lost, a group of friendly Pokémon appeared and started to use their 
    special powers to teleport them to safety!'",
    "'You're getting closer to the end. As the hangman's knot started to tighten, a team of 
    Power Rangers burst onto the scene and started to take out the executioner with their mighty weapons!'",
    "'As the crowd looked on in horror, a group of dancers appeared out of nowhere and started to 
    stage an impromptu musical number, distracting the executioner long enough for them to escape!'"
  ]

  
  def self.random_success_quip
    puts "\n#{SUCCESS_QUIPS.sample.green.italic}\n\n"
  end
  
  def self.random_failure_quip
    puts "\n#{FAILURE_QUIPS.sample.red.italic}\n\n"
  end
end
