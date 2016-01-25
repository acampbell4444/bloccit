class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  scope :publicly_viewable, -> { where(private: false)}
  scope :privately_viewable, -> { where(private: true)}
  scope :visible_to, -> (user) { user ? all : publicly_viewable }


end
