# Text-based Game Challenge
class Room
    attr_accessor :name, :description, :exits
    def initialize(name, description)
      @name = name
      @description = description
      @exits = {}
    end
  end

class Game 

    def initialize 
      @rooms = {}
      @current_room = nil
    end

    def add_room(room)
      @rooms[room.name] = room
    end

    def start_game
        puts 'Welcome to the Zoopocalypse - chaos has erupted inside the zoo. A Virus has broken out, turning animals and humans alike into mindless, flesh-eating zombies 🧟‍♂️. The once beautiful grounds are now littered with the remains of the infected.'
        puts 'You are the Zookeeper. You and a group of survivors have taken refuge inside the Busy Bee Cafe, barricading the doors and windows to keep the undead at bay. It is your mission to navigate through the zoo and help as many survivors as possible to escape. The infected are everywhere, one wrong move could mean certain death, Goodluck!'
        puts '-----------------------------------------'
      @current_room = @rooms.values.first
      puts "Type 'help' for instructions.\n"
      play_game
    end
    def play_game
      loop do
        puts @current_room.description
        print_current_room_info
        input = gets.chomp.downcase
        case input
        when "help"
            display_help
        when "quit"
          puts "Thanks for playing!"
          break
        when "look"
            check_room_event(@current_room)
        when "north", "south", "east", "west"
          move(input)
        else
          puts "Invalid command. Type 'help' for instructions."
        end
      end
    end

    def print_current_room_info
        puts "What would you like to do? (Type 'help' for instructions.)"
        print "> "
      end

    def display_help
        puts "Instructions:"
        puts "'north', 'south', 'east', 'west' - Move in the specified direction."
        puts "'look' - Examine the room."
        puts "'quit' - Quit the game."
    end

    def move(direction)
      exit = @current_room.exits[direction]
      if exit.nil?
        puts "You cannot go that way."
      else
        @current_room = @rooms[exit]
      end
    end

    def check_room_event(room)
      case room.name
        when "Room 1"
          puts "The power just cut off and the doors have unlocked. It isn't safe here anymore, time to get out!"
          puts "You can either type 'North' to Komodo Kingdom or 'East' to Oasis Lounge - pick wisely!"
        when "Room 2"
          puts "Stop for a quick beer and refuel.🍺 Things are looking up! You can hear the Hummingbirds closing in - CHUG and get moving!"
          puts "Type 'South' to try and catch the air tram or type 'West' to go back to Busy Bee Cafe."
        when "Room 3"
          puts "The Komodos have been compromised and they are hungry! 🐲🐲🐲 You must vacate immediately!"
          puts "Type 'West' to go to Hummingbird Habitat or 'East' to Safari Kitchen - hurry!"
        when "Room 4"
          puts "Whoa! These Hummingbirds are the size of Pterodactyls and there are no other exits 😱 - To escape you must board a sleeping zombie Hummingbird and type 'East' to fly back over the Killer Komodos! *jumps on Hummingbird*"  
        when "Room 5"
          puts "Looks like looters have stolen all the food and the stove has caught fire! Smoke is filling the air and visibility is low. Zombies start to creep out from the smoke and our Hummingbird has fluttered off due to smoke inhalation. Suddenly you spy another exit - the Zombies are closing in and you have a split second to escape! Type 'South' to seek refuge at Oasis Lounge."
      
      end
    end

  end
  # Create rooms
  room1 = Room.new("Room 1", "You are in the Busy Bee Cafe's dining room.")
  room2 = Room.new("Room 2", "You have entered the Oasis Lounge.")
  room3 = Room.new("Room 3", "You have entered the Komodo Kingdom.")
  room4 = Room.new("Room 4", "You have entered the Hummingbird Habitat.")
  room5 = Room.new("Room 5", "You have entered the Safari Kitchen")
  room6 = Room.new("Room 6", "Luck you! You have caught the last air tram out of the Zoo! The tram operator appears to be alive and well - you are the last person to catch a ride to safety! Type 'quit' to exit the game")

  # Connect rooms
  room1.exits["east"] = "Room 2"
  room1.exits["north"] = "Room 3"
  room2.exits["west"] = "Room 1"
  room3.exits["south"] = "Room 1"
  room3.exits["west"] = "Room 4"
  room3.exits["east"] = "Room 5"
  room4.exits["east"] = "Room 3"
  room4.exits["north"] = "Room 5"
  room5.exits["south"] = "Room 2"
  room5.exits["west"] = "Room 3"
  room2.exits["south"] = "Room 6"
  room2.exits["north"] = "Room 5"
  

  # Add rooms to the game
  game = Game.new
  game.add_room(room1)
  game.add_room(room2)
  game.add_room(room3)
  game.add_room(room4)
  game.add_room(room5)
  game.add_room(room6)
  # Start the game
  game.start_game


        

