class Twerk < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true, length: {maximum: 140, too_long: "...You twerked too much."}
end
