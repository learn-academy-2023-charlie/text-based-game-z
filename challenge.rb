# Text-based Game Challenge

p 'Welcome to the Zoopocalypse where you are the Zookeeper in charge of a small group of survivors. You will be tasked with a number of decisions in order to try and escape the zoo. If you are ready to start this intense journey type "y" for yes, "n" for no.'

answer = gets.chomp.downcase

def play_or_no answer
    if answer = 'y'
        p 'Please enter the name of your character'
        
    else
        p 'do not start game'
    end
end 

play_or_no(answer)

name = gets.chomp.downcase
p "Welcome to the San Diego Zoo #{name}. Chaos has erupted inside the zoo. A Virus has broken out, turning animals and humans alike into mindless, flesh-eating zombies. The once beautiful grounds are now littered with the remains of the infected. You and a group of survivors have taken refuge inside the Busy Bee Cafe, barricading the doors and windows to keep the undead at bay. It is your mission to navigate through the zoo and help as many survivors as possible to escape. The infected are everywhere, one wrong move could mean certain death, Goodluck! Press enter to start"
starts = gets.chomp

p 'You and the survivors have realized food and water is scarce. Do you continue to wait for help or do you leave the comfort of Busy Bee and take matters into your own hands? Type "stay" to wait for help, Type "go" to leave the building.'

option_1 = gets.chomp.downcase

def first_even option_1
    if option_1 = 'stay'
        ';adksfj'
    else 
        

