class UserPolicy < ApplicationPolicy

  def can_modify?
    user.admin? || user == record 
  end
  
  def can_view?
    can_modify?  
  end
  
  class Scope < Scope
    def resolve
      if user.admin? 
        scope.all
      else
        scope.where(id: record.id)
      end
    end
  end

end
