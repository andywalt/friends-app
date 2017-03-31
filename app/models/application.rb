class Application < ApplicationRecord
	belongs_to :user

	has_many :questions

	accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

	validates :name, :description, presence: true
end
