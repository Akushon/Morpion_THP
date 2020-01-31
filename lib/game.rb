
class Game
  attr_accessor :choice
  def initialize
    puts ColorizedString["-----------------------------------------------------"].colorize(:red) #texte de lancement
    puts ColorizedString["====================================================="].colorize(:yellow)
    puts ColorizedString["-------------Bienvenu sur mon morpion !--------------"].colorize(:black).colorize( :background => :light_blue)
    puts ColorizedString["====================================================="].colorize(:yellow)
    puts ColorizedString["-----------------------------------------------------\n\n\n"].colorize(:red)
  end

  def game_launch #lancement de la partie: entrée des noms des joueurs + affichage initial de la grille
    board = Board.new
    puts ColorizedString["Joueur 1 rentre ton nom !\n"].colorize(:yellow)
    player1 = Player.new(gets.chomp)
    player1.show_state
    puts ColorizedString["Joueur 2 rentre ton nom !\n"].colorize(:green)
    player2 = Player.new(gets.chomp)
    player2.show_state
    puts "Voici la grille : \n"
    board.board_display

    while 1 do #while 1 = boucle infinie (nombre de partie ilimitée)
      puts ColorizedString["#{player1.name} à toi de jouer, rentre la ligne, puis la colonne, ex: A3, B1, C1... (tape q pour quitter)"].colorize(:yellow)
      @choice = gets.chomp #entrée du joueur 1
      if @choice == "q"
        exit(true) #quitte le programme ruby si l'utilisateur rentre <q>
      end
      board.board_case_choosed(@choice.to_s.upcase)
      system("clear") #vide le terminal
      board.board_display
      if board.test_of_winning == "1"
        board.board_display
        player1.win_point #ajout de point + affichage des totaux
        player1.show_state
        player2.show_state
      end
      puts ColorizedString["#{player2.name} à toi de jouer, rentre la ligne, puis la colonne, ex: A3, B1, C1... (tape q pour quitter)"].colorize(:green)
      @choice = gets.chomp #entrée du joueur 1
      if @choice == "q"
        exit(true) #quitte le programme ruby si l'utilisateur rentre <q>
      end
      board.board_case_choosed(@choice.to_s.upcase)
      system("clear") #vide le terminal
      board.board_display
      if board.test_of_winning == "2"
        board.board_display
        player2.win_point #ajout de point + affichage des totaux
        player1.show_state
        player2.show_state
      end
    end
  end
end
