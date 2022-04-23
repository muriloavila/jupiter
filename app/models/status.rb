class Status < ApplicationRecord
  has_many :project
  self.table_name = "status"
end