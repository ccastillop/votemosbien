class AnswerPolicy < ApplicationPolicy
  
  def can_modify?
    true
  end

  def can_view?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

end
