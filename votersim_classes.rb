class Voter
    attr_accessor :name, :politics, :vote_for

    def initialize(voter_name, politics)
      @name = voter_name
      @politics = politics
    end
end

  class Candidate < Voter
    attr_accessor :name, :party, :vote_for

    def initialize(candidate_name, party)
      @name = candidate_name
      @party = party
      @vote_for = party
    end
  end
