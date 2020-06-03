class Player < ApplicationRecord
  default_scope { where(is_admin: false) }

  def answer(question)
    Answer.where(player: self, question: question).first&.answer || ''
  end
end
