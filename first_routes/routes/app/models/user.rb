class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    class_name: :Contact,
    primary_key: :id,
    foreign_key: :user_id,
    dependent: :destroy

#the action, not the contact object
    has_many :contact_shares,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :ContactShare,
      dependent: :destroy

      has_many :shared_contacts,
      through: :contact_shares,
      source: :contact

end
