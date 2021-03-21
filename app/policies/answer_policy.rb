class AnswerPolicy < ApplicationPolicy
  
  def can_modify?
    user.admin? || record.user == user
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
