class UserPolicy < ApplicationPolicy

  def can_modify?
    user.admin? || user == record 
  end
  
  def can_view?
    can_modify?  
  end
  
  def permitted_attributes
    attrs = [
      :email, 
      :first_name, :last_name, 
      :phone, :country_code,
      :password, :password_confirmation,
      :auth_photo
    ]
    if user.admin? 
      attrs << :level
    end
    attrs
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
