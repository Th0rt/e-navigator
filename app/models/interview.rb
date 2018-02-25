class Interview < ApplicationRecord
  belongs_to :user
  validate :date_check
  enum status: { 保留: 0, 承認: 1, 却下: 2 }

  def date_check
    if self.date < Time.zone.now
      errors.add(:エラー, "：過去の日時は使用できません")
    end
  end
  
end
