require 'spec_helper'

describe PeopleController, "Routing" do
  it { {get: "/people/new"}.should route_to(controller: "people",
                                            action: "new") }
  it { {post: "/people"}.should route_to(controller: "people",
                                            action: "create") }
  it { {delete: "/people/1"}.should route_to(controller: "people",
                                             action: "destroy",
                                              id: "1") }
end

describe PeopleController, "Actions" do
  render_views

  describe "on GET to #new" do
    it "should render the people/new template" do
      get :new
      should render_template("people/new")
    end

    it "should assign a new person to @person" do
      get :new
      assigns(:person).should_not be_nil
    end

    it "should load all existing people into @people" do
      get :new
      assigns(:people).should_not be_nil
    end
  end

  describe "on POST #create" do

    it "should create a new person" do
      expect {
        post :create, person: {full_name: "Jose Gomez",
                               email: "jose.gomez@koombea.com"}
      }.to change(Person, :count).by(1)
    end

    it "should set the flash message on success" do
      post :create, person: {full_name: "Jose Gomez",
                             email: "jose.gomez@koombea.com"}
      should set_the_flash
    end

    it "should redirect back to the new person url" do
      post :create, person: {full_name: "Jose Gomez",
                               email: "jose.gomez@koombea.com"}
      should redirect_to(new_person_path)
    end

    it "should set a flash message if person is invalid" do
      post :create
      should set_the_flash
    end

    it "should render the new template if there is a validation error" do
      post :create
      should render_template("people/new")
    end
  end

  describe "on DELETE to #destroy" do
    before do
      @person = Person.create(full_name: "Jose Gomez",
                    email: "jose.gomez@koombea.com")
    end

    it "should delete a person" do
      expect {
        xhr :delete, :destroy, id: @person.id
      }.to change(Person, :count).by(-1)
    end

    it "should render the destroy template" do
      xhr :delete, :destroy, id: @person.id
      should render_template("people/destroy")
    end
  end

end
