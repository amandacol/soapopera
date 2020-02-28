class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end
  def show?
    true
  end
  def new?
    true
  end
  def destroy?
    true
  end
end
