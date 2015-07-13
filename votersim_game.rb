require_relative './votersim_classes'
require_relative './voting_sim'

class VoterSim

  attr_accessor :candidate_array, :voter_array

  def initialize
    @candidate_array = []
    @voter_array = []
  end

  def vote_for
    start = Campaign.new(@candidate_array, @voter_array)
    start.voter_choice
    start.tally_votes
    start.winner
  end

  def exit_game
      puts "Goodbye."
      exit(0)
  end

  def main_menu                  # main menu presents the four main choices
    puts <<-END
    Welcome to the main menu.
    Please select one of the following.
    (C)reate a Candidate or a Voter
    (L)ist the Candidates or Voters
    (U)pdate an existing Candidate or a Voter
    (V)ote!
    (E)xit the program.
    END

  user_input = gets.chomp.upcase
    case user_input
      when "C"      # create a character of your own
        create_character
      when "L"      # should output list of all the created characters
        list_show
      when "U"      # allow update on person's name and party/politics
        update_list
      when "V"      # run vote simulation
        vote_for
      when "E"      # exit the game
        exit_game
      else
        puts "Not a valid option.\n"
        main_menu
    end
  end

  def create_character       # when you choose to create a candidate
    puts "Would you like to create a (C)andidate or a (V)oter?"
    user_input = gets.chomp.upcase

    case user_input
      when "C"                # when you choose to create a candidate
        create_cand
      when "V"                # when you choose to create a voter
        create_voter
      else
        puts "Please pick a valid option.\n"
        create_character
    end
  end

  def create_cand             # create a candidate, Democratic or Republican
    puts "Enter the name of the Candidate."
    cand_name = gets.chomp.capitalize

    puts "Choose a political party: (D)emocrat or (R)epublican."
    cand_party = gets.chomp.upcase

      case cand_party
        when "D"
          name = Candidate.new(cand_name, "Democrat")
          puts "#{cand_name} has been added as a Democrat.\n\n"
        when "R"
          name = Candidate.new(cand_name, "Republican")
          puts "#{cand_name} has been added as a Republican.\n\n"
        else
          puts "Please choose a valid option."
          create_cand
      end
      @candidate_array << name
      main_menu
  end

  def create_voter            # create a voter and choose political affiliation
      puts "Enter name of the Voter."
      voter_name = gets.chomp.capitalize

      puts <<-END
        Choose the Voter's political affiliation.
        (C)onservative
        (I)ndepedent
        (L)ibertarian
        (M)assachusetts Democrat
        (P)rogressive
        END

      voter_politics = gets.chomp.upcase # newly created voter's choice of politics

      case voter_politics
        when "C"
          name = Voter.new(voter_name, "Conservative")
          puts "#{voter_name} has been added as a Conservative.\n\n"
        when "I"
          name = Voter.new(voter_name, "Independent")
          puts "#{voter_name} has been added as an Independent.\n\n"
        when "L"
          name = Voter.new(voter_name, "Libertarian")
          puts "#{voter_name} has been added as a Libertarian.\n\n"
        when "M"
          name = Voter.new(voter_name, "Massachusetts Democrat")
          puts "#{voter_name} has been added as a Massachusetts Democrat.\n\n"
        when "P"
          name = Voter.new(voter_name, "Progressive")
          puts "#{voter_name} has been added as a Progressive.\n\n"
        else
          puts "That is not a valid entry."
          create_voter
      end
      @voter_array << name
      main_menu
  end


  def list_show               # show list of candidates or voters
    puts <<-END
    Would you like to see the list of (C)andidates or (V)oters?
    END

    user_input = gets.chomp.upcase
    case user_input
    when "C"                  # when you select list candidates
      @candidate_array.each { |x| print(x.name.capitalize.to_s +
        " " + x.party.capitalize.to_s)
        puts }
    when "V"                  # when you select list voters
      @voter_array.each { |x| print(x.name.capitalize.to_s + " " +
        x.politics.capitalize.to_s)
        puts }
    else
      puts "Please choose which list you would like to view!\n"
      list_show
    end
    main_menu
  end


  def update_voter               # when you want to update a voter's info
    puts "Enter the name of the Voter that you would like to change."
    voter_name = gets.chomp.capitalize
    @voter_array.each_with_index do |v, index|
    #  p "this is v #{v.inspect}"
    #  p "this is the voter name #{voter_name}"
    if v.name == voter_name
      puts "Enter the new name for the Voter."
      new_name = gets.chomp
      puts <<-END
      Pick a new political affiliation for the Voter from the following options.
      (C)onservative, (I)ndepedent, (L)ibertarian, (M)assachusetts Democrat, (P)rogressive
      END
      new_politics = gets.chomp.upcase

      case new_politics
      when "C"
        v.politics = "Conservative"
      when "I"
        v.politics = "Independent"
      when "L"
        v.politics = "Libertarian"
      when "M"
        v.politics = "Massachusetts Democrat"
      when "P"
        v.politics = "Progressive"
      end
      v.name = new_name
      puts "You have updated the voter's information."
      print v.name.capitalize + " - "
      puts v.politics
    elsif   @voter_array.size == index
      puts "That voter does not exist. Please try again.\n"
      update_voter
    end
  end
  end
end

  def update_list           # when you want to update the list
    puts "Would you like to update a (C)andidate or a (V)oter?"
    user_input = gets.chomp.upcase

    case user_input
      when "C"                # when you choose to update a candidate
        update_candidate
      when "V"                # when you choose to update a voter
        update_voter
      else
        puts "Please update one of the two options available."
        update_list
    end
    main_menu
  end

  def update_candidate      # when you want to update a candidate's info
    puts "Enter the name of the Candidate that you would like to update."
    candidate_name = gets.chomp.capitalize
    @candidate_array.each do |c|

    if c.name == candidate_name
      puts "Enter the new name for the Candidate."
      new_name = gets.chomp

      puts <<-END
      Pick a new political party for the Candidate.
      (D)emocrat or (R)epublican
      END
      new_party = gets.chomp.upcase

      case new_party
        when "D"
          c.party = "Democrat"
        when "R"
          c.party = "Republican"
      end
      c.name = new_name
      puts "You have updated the candidate's information.\n\n"
      print c.name.capitalize + " - "
      puts c.party
    else
      puts "That candidate does not exist. Please try again.\n\n"
      update_candidate
    end
  end

  end

start = VoterSim.new
start.main_menu
