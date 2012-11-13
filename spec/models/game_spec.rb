require 'spec_helper'

describe Game, "callbacks" do

  describe "before_create" do
    before do
      @person_1 = Person.create(full_name: "Jose Gomez",
                                email: "jose.gomez@koombea.com")
      @person_2 = Person.create(full_name: "David Bohorquez",
                                email: "david.bohorquez@koombea.com")
      @person_3 = Person.create(full_name: "Mauricio Mejia",
                                email: "mauricio.mejia@koombea.com")
      @person_4 = Person.create(full_name: "Richard Roncancio",
                                email: "richard.roncancio@koombea.com")
    end

    it "should create a new SecretFriendship for every given person" do
      expect {
        @game = Game.create(run_date: Date.today)
      }.to change(SecretFriendship, :count).by(Person.count)
    end

    it "should select a random friend for every given person. Everyone must have a secret friend" do
      @people_ids = Person.all.map(&:id)
      @game = Game.create(run_date: Date.today)

      @game.secret_friendships.map(&:friend_id).should include(*@people_ids)
    end

  end

end
