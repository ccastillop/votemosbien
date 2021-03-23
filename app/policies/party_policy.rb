class PartyPolicy < ApplicationPolicy

  def can_modify?
    user.admin? || (user.candidate? && record.respond_to?(:user) && record.user == user)
  end

  def permitted_attributes
    attrs = [
      :name, :logo,
      :web, :email
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
