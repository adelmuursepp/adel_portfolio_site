class ResourceItem < ApplicationRecord
  belongs_to :resource_topic

  enum status: { draft: 0, published: 1 }


  validates_presence_of :title, :body, :resource_topic_id, :status


  has_many :resource_comments, dependent: :destroy


  scope :hide_drafts, -> { where(status: 'published') }

  def self.protect_drafts user
    if user.has_role?(:site_admin)
      all
    else
      hide_drafts
    end
  end

  def self.by_recent
    order("created_at DESC")
  end
end
