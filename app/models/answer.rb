class Answer < ApplicationRecord
  belongs_to :test
  belongs_to :application
  belongs_to :user
end
