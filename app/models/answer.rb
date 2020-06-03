class Answer < ApplicationRecord
  belongs_to :player
  belongs_to :question

  enum answer: %i[a b c d]
end
