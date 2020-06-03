class Player < ApplicationRecord
  default_scope { where(is_admin: false) }
end
