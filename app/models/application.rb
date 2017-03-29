class Application < ApplicationRecord
	belongs_to :user

	has_many :questions, inverse_of: :application

	accepts_nested_attributes_for :questions

=begin
	reject_if: :all_blank, allow_destroy: true
=end

	validates :name, :description, presence: true
end
