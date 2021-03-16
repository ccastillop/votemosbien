class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user || User.new
    @record = record
    ApplicationPolicy.create_alias
  end

  def can_modify?
    user.admin?
  end

  def can_view?
    true
  end

  def self.create_alias
    # These are the defaults policies for each action
    %i[new? create? edit? update? destroy?].each do |m|
      define_method m, -> { can_modify? }
    end
    %i[index? show?].each do |m|
      define_method m, -> { can_view? }
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user || User.new
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end


