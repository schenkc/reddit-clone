class Link < ActiveRecord::Base
  validates :url, :title, :submitter_id, presence: true

  has_many(
  :sub_connections,
  class_name: 'LinkSub',
  foreign_key: :link_id
  )

  belongs_to(
  :submitter,
  class_name: 'User',
  foreign_key: :submitter_id)

  has_many :subs, through: :sub_connections, source: :sub
  has_many :comments

end
