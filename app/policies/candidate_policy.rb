class CandidatePolicy < ApplicationPolicy

  def can_modify?
    user.admin? || (user.candidate? && record.user == user)
  end

  def permitted_attributes
    attrs = [
      :dni, :names, :father_surname,
      :mother_surname, :number
    ]
    if user.admin? 
      attrs << :user_id
    end
    attrs
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
