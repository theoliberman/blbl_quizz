class Player < ApplicationRecord
  default_scope { where(is_admin: false) }

  def answer(question)
    Answer.find_by(player: self, question: question)&.answer || ''
  end
end
