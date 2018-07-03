class Guest < ApplicationRecord
  belongs_to :group
  has_secure_token :auth_token
  validates :name, :last_name, presence: true
  enum attending: {not_set: 0, no: 1, yes: 2}, _prefix: true
  enum day_before: {not_set: 0, no: 1, yes: 2}, _prefix: true
  enum day_after: {not_set: 0, no: 1, yes: 2}, _prefix: true
end
