class Interview < ApplicationRecord
  belongs_to :user
  enum status: {保留: 0, 承認: 1, 却下: 2}
end
