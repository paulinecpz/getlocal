class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.store.user == user
  end

  def create?
    record.store.user == user
  end

  def update?
    record.store.user == user
  end

  def destroy?
    record.store.user == user
  end
end
