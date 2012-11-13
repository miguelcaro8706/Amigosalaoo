require 'spec_helper'

describe SecretFriendship, "Validations" do

  describe "person_id" do
    before do
      @person_1 = Person.create(full_name: "Jose Gomez",
                                email: "jose.gomez@koombea.com")
      @person_2 = Person.create(full_name: "David Bohorquez",
                                email: "david.bohorquez@koombea.com")
      @person_3 = Person.create(full_name: "Mauricio Mejia",
                                email: "mauricio.mejia@koombea.com")
      @person_4 = Person.create(full_name: "Richard Roncancio",
                                email: "richard.roncancio@koombea.com")
      @game     = Game.create(run_date: Date.today)
    end

    it "should not let a person have himself as secret friend" do
      @secret_friendship_1 = SecretFriendship.new(person_id: @person_1.id,
                                                  friend_id: @person_1.id,
                                                  game_id: @game.id)

      @secret_friendship_1.should_not be_valid
    end

    it "should not let 2 people have the same friend_id" do
      @secret_friendship_1 = SecretFriendship.create(person_id: @person_1.id,
                                                  friend_id: @person_3.id,
                                                  game_id: @game.id)
      @secret_friendship_2 = SecretFriendship.new(person_id: @person_2.id,
                                                  friend_id: @person_3.id,
                                                  game_id: @game.id)

      @secret_friendship_2.should_not be_valid
    end


  end
end
