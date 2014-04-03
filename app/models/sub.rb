class Sub < ActiveRecord::Base

  validates :name, :mod_id, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :mod_id,
    primary_key: :id
  )

   has_many :links

end
