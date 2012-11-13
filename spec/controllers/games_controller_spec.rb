require 'spec_helper'

describe GamesController, "Routing" do
  it {{get: "/games/new"}.should route_to(controller: "games",
                                          action: "new") }
  it {{post: "/games"}.should route_to(controller: "games",
                                       action: "create") }
end

describe GamesController, "Actions" do
  render_views

  describe "on GET to #new" do
    it "should render the 'games/new' template" do
      get :new
      should render_template("games/new")
    end
  end

  describe "on POST to #create" do
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

    it "should create a new Game" do
      expect {
        post :create
      }.to change(Game, :count).by(1)
    end
  end
end
