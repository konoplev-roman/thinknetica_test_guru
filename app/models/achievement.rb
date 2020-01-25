class Achievement < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :after, ->(date) { where(created_at: [date..Time.current]) }

  def self.uniq_badge_ids
    select(:badge_id).distinct.order(badge_id: :asc).pluck(:badge_id)
  end
end
