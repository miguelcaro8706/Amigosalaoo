class SecretFriendship < ActiveRecord::Base
  attr_accessible :friend_id, :person_id, :game_id

  # it should not let a person have himself as secret friend
  validates_exclusion_of :person_id, :in => lambda { |secret_friendship| [secret_friendship.friend_id] },
                         :message => "should not be the same as friend_id"

  validates :friend_id, presence: true,
    uniqueness: {scope: :game_id}
end
