class Project < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :users, :through => :works

  validates :name, presence: true, length: {minimum: 5}
  validates :company, presence: true
  validates :default_rate, numericality: {only_integer: true,
                                          greater_than: 50}
  validates :slug, uniqueness: true, presence: true
  scope :lowdefaultrate, -> { where("default_rate < 100") }
end
