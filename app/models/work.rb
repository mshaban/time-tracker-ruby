class Work < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  validates :project,
            :user,
            :datetimeperformed, presence: true

  validates :hours, numericality: {only_integer: true,
                                   greater_than: 0,
                                   less_than: 8}

  validate :date_is_in_past

  scope :fullday, -> { where("hours >= 8") }
  scope :recent, -> { where ("datetimeperformed > '#{Time.now - 7.days}' ") }


  def date_is_in_past
    if datetimeperformed.present? && datetimeperformed > Time.now
      errors.add(:datetimeperformed, "Can't be in the future")
    end
  end

end
