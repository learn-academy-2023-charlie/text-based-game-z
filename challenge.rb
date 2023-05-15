# Text-based Game Challenge
class Room
    attr_accessor :name, :description, :exits
    def initialize(name, description)
      @name = name
      @description = description
      @exits = {}
      @inventory = []
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
        puts 'Welcome to the Zoopocalypse - chaos has erupted inside the zoo. A Virus has broken out, turning animals and humans alike into mindless, flesh-eating zombies. The once beautiful grounds are now littered with the remains of the infected.'
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
        when "inventory"
            show_inventory
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

    def show_inventory
        if @inventory.empty?
          puts "Your inventory is empty."
        else
          puts "Your inventory:"
          @inventory.each { |item| puts "- #{item}" }
        end
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
          puts "The power just cut off and you hear a noise coming from the fridge..."
          if @inventory.include?("knife")
            puts "You already took the knife from the fridge."
          else
            puts "You found a knife in the fridge! You pick it up and put it in your inventory."
            @inventory << "knife"
          end
        end
    end

  end
  # Create rooms
  room1 = Room.new("Room 1", "You are in the Busy Bee Cafe's dining room.")
  room2 = Room.new("Room 2", "You have entered the Oasis Lounge.")
  room3 = Room.new("Room 3", "You have entered the Komodo Kingdom.")
  # Connect rooms
  room1.exits["east"] = "Room 2"
  room1.exits["north"] = "Room 3"
  room2.exits["west"] = "Room 1"
  room3.exits["south"] ="Room 1"
  # Add rooms to the game
  game = Game.new
  game.add_room(room1)
  game.add_room(room2)
  game.add_room(room3)
  # Start the game
  game.start_game


        

