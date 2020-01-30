
class Board
  attr_accessor :position, :flag  #variable d'instance

  def initialize
    @flag = 0
    @position = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "} #hash qui contient les croix et les ronds
  end

  def board_case_choosed(case_choosed)
    while ((case_choosed != "A1") && (case_choosed != "A2") && (case_choosed != "A3") && (case_choosed != "B1") && (case_choosed != "B2") && (case_choosed != "B3") && (case_choosed != "C1") && (case_choosed != "C2")) && (case_choosed != "C3") || (@position[case_choosed] != " ") do #tant que le texte entrée ou la case n'est pas vide, il faut réesayer
      puts "Ce que tu à écris n'es pas bon ou la case est pleine, réessaye"
      case_choosed = gets.chomp.to_s.upcase
    end
    if @flag == 0 #flag + conditions qui permet de changer entre le rond et la croix à chaque entrée de l'utilisateur
      @flag = 1
      position[case_choosed] = "x"
    else
      @flag = 0
      position[case_choosed] = "o"
    end
  end

  def board_display #la structure graphique du morpion
    puts ColorizedString["     1     2     3  \n   ----- ----- -----\nA |  #{@position["A1"]}  |  #{@position["A2"]}  |  #{@position["A3"]}  |\n   ----- ----- -----\nB |  #{@position["B1"]}  |  #{@position["B2"]}  |  #{@position["B3"]}  |\n   ----- ----- -----\nC |  #{@position["C1"]}  |  #{@position["C2"]}  |  #{@position["C3"]}  |\n   ----- ----- -----\n"].colorize(:red)
  end

  def test_of_winning #test si le joueur 1 à gagné
    if (@position["A1"] == "x" && @position["A2"] == "x" && @position["A3"] == "x") || (@position["B1"]  == "x" && @position["B2"]  == "x" && @position["B3"] == "x") || (@position["C1"] == "x" && @position["C2"] == "x" && @position["C3"] == "x") || (@position["A1"] == "x" && @position["B1"] == "x" && @position["C1"] == "x") || (@position["A2"] == "x" && @position["B2"] == "x" && @position["C2"] == "x") || (@position["A3"] == "x" && @position["B3"] == "x" && @position["C3"] == "x") || (@position["A1"] == "x" && @position["B2"] == "x" && @position["C3"] == "x") || (@position["A3"] == "x" && @position["B2"] == "x" && @position["C1"] == "x")
      puts "Joueur 1 à gagné"
      @position = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "} #RAZ du morpion
      return "1"
    end #test si le joueur 2 à gagné
    if (@position["A1"] == "o" && @position["A2"] == "o" && @position["A3"] == "o") || (@position["B1"]  == "o" && @position["B2"]  == "o" && @position["B3"] == "o") || (@position["C1"] == "o" && @position["C2"] == "o" && @position["C3"] == "o") || (@position["A1"] == "o" && @position["B1"] == "o" && @position["C1"] == "o") || (@position["A2"] == "o" && @position["B2"] == "o" && @position["C2"] == "o") || (@position["A3"] == "o" && @position["B3"] == "o" && @position["C3"] == "o") || (@position["A1"] == "o" && @position["B2"] == "o" && @position["C3"] == "o") || (@position["A3"] == "o" && @position["B2"] == "o" && @position["C1"] == "o")
      puts "Joueur 2 à gagné"
      @position = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "} #RAZ du morpion
      return "2"
    end
    if @position.value?(" ") #si il reste une case vide, le jeu continu
      puts "La partie continue"
    else
      puts "===========EGALITE==========="
      @position = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "} #RAZ du morpion
    end
  end
end
