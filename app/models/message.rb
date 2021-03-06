class Message < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :text
  end
end
