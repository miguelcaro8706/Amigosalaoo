class Game < ActiveRecord::Base
  attr_accessible :run_date

  validates :run_date, presence: true

  has_many :secret_friendships

  before_create :create_secret_friendships

  def create_secret_friendships
    begin
      pairs = initialize_secret_friendships
    end while pairs.any? {|person_id, friend_id| friend_id.nil?}

    pairs.each do |person_id, friend_id|
      self.secret_friendships.build(person_id: person_id,
                                    friend_id: friend_id)
    end
  end

  def initialize_secret_friendships
    @people ||= Person.all
    people_ids = @people.map(&:id)
    pairs = {}
    @people.each do |person|
      friend_id = (people_ids - [ person.id ]).shuffle.first
      people_ids.delete(friend_id)

      pairs[person.id] = friend_id
    end

    pairs
  end

end
