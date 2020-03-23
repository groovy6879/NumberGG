# The number 1 Number Guessing Game around!

# Introduction to the game
puts("Bienvenue au jeu Trouver le bon numéro! 
Quel est votre nom?")
name = gets.chomp
puts("Bonjour #{name}!")

loop do
    puts("Veuillez choisir un niveau de difficulté parmi les suivants :")
    puts("
        1 - Très facile : chiffres de 1 à 10, essais illimités
        2 - Facile: chiffres de 1 à 10, 5 essais
        3 - Moyen: chiffres de 1 à 100, 6 essais
        4 - Difficile: chiffres de 1 à 500, 8 essais
        5 - Très difficile: chiffres de 1 à 1000, 9 essais")
    level = gets.to_i
    if level < 1 or level > 5 then
        puts("Vous devez choisir un niveau de difficulté entre 1 et 5.")
        break
    else
        puts("Vous avez choisi le niveau #{level}. Bon succès!")
    end
    winner = false
    guessTracker = 0
    noMoreGuess = false

    # Define level caracteristics
    if level == 1 then
        numberToGuess = rand(1..10)
        guessLimit = 10000
        # Because 10000 tries are almost like unlimited. If you can't figure it out after 10 tries...
        # you have clearly to much free time and/or maybe not enough knowledge of numbers yet!
    elsif level == 2 then
        numberToGuess = rand(1..10)
        guessLimit = 5
    elsif level == 3 then
        numberToGuess = rand(1..100)
        guessLimit = 6
    elsif level == 4 then
        numberToGuess = rand(1..500)
        guessLimit = 8
    elsif level == 5 then
        numberToGuess = rand(1..1000)
        guessLimit = 9
    end

    # Selection section
    while winner == false and !noMoreGuess
        if guessTracker < guessLimit then
            puts("Faites votre choix de numéro.")
            guess = gets.to_i
            if guess < numberToGuess then
                puts("Désolé, la réponse est plus élevée.")
                guessTracker += 1
                if level != 1 then
                    puts("Il vous reste #{guessLimit - guessTracker} essai(s).")
                else
                    puts("Essayez de nouveau!")
                end
            elsif guess > numberToGuess then
                puts("Désolé, la réponse est plus basse.")
                guessTracker += 1
                if level != 1 then
                    puts("Il vous reste #{guessLimit - guessTracker} essai(s).")
                else
                    puts("Essayez de nouveau!")
                end
            else
                puts("Félicitations #{name}! Vous avez gagné!")
                winner = true
            end
        else
            noMoreGuess = true
            puts("Désolé #{name}, vous avez perdu. La bonne réponse était #{numberToGuess}.")
        end    
    end

    # Replay or not?
    puts("Voulez-vous jouer une autre partie? [oui/non]")
    replay = gets.chomp
    if replay == "oui" then
        puts("Vous avez choisi de jouer à nouveau. #{name}, vous êtes un(e) brave. Mais n'oubliez pas que le jeu doit rester un jeu.") 
    else
        break
    end
end
puts("#{name}, merci d'avoir joué et au revoir!")
