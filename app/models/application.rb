class Application < ApplicationRecord
	belongs_to :user

	has_many :tests

	accepts_nested_attributes_for :tests, reject_if: :all_blank, allow_destroy: true

	validates :name, :description, presence: true
end
