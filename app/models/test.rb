class Test < ApplicationRecord
  belongs_to :application, required: false
  validates :question, presence: true
  has_many :answers
end
