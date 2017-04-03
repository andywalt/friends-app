class Test < ApplicationRecord
  belongs_to :application, required: false
  validates :question, presence: true
end
