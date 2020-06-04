class Answer < ApplicationRecord
  belongs_to :player
  belongs_to :question

  enum answer: %i[a b c d]

  validates :player, :question, presence: true
  validate :question_not_locked

  after_create :give_points

  def give_points
    player.update(points: player.points + question.points) if answer == question.answer
  end

  def question_not_locked
    errors.add(:question, "can't be locked") if question&.locked
  end
end
