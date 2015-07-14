
class Campaign
  attr_accessor :votes_repub, :votes_dem, :candidates, :voters

  def initialize(candidates, voters)
    @votes_repub = 0
    @votes_dem = 0
    @candidates = candidates
    @voters = voters
  end


  def voter_choice
    @voters.each do |v|
      case v.politics
        when "Libertarian"
          if rand(1..100) <= 90
            v.vote_for = "Republican"
            sleep(1)
            puts "I like this Republican"
          else
            v.vote_for = "Democrat"
            sleep(1)
            puts "I like this Democrat"
          end
        when "Conservative"
          if rand(1..100) <= 75
            v.vote_for = "Republican"
            sleep(1)
            puts "I like this Republican"
          else
            v.vote_for = "Democrat"
            sleep(1)
            puts "I like this Democrat"
          end
        when "Independent"
          if rand(1..100) <= 50
            v.vote_for = "Republican"
            sleep(1)
            puts "I like this Republican"
          else
            v.vote_for = "Democrat"
            sleep(1)
            puts "I like this Democrat"
          end
        when "Progressive"
          if rand(1..100) <= 25
            v.vote_for = "Republican"
            sleep(1)
            puts "I like this Republican"
          else
            v.vote_for = "Democrat"
            sleep(1)
            puts "I like this Democrat"
          end
        when "Massachusetts Democrat"
          if rand(1..100) <= 10
            v.vote_for = "Republican"
            sleep(1)
            puts "I like this Republican"
          else
            v.vote_for = "Democrat"
            sleep(1)
            puts "I like this Democrat"
          end
      end
      end
  end

  def tally_votes
    @voters.each do |v|
      if v.vote_for == "Republican"
        @votes_repub += 1
      else
        @votes_dem += 1
      end
  end
  end

  def winner
    if @votes_repub > @votes_dem
      puts "The Republican Party wins the Presidential Election!"
    else
      puts "The Democratic Party wins the Presidential Election!"
    end
  end
end
