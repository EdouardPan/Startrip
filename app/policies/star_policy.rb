class StarPolicy < ApplicationPolicy

  def new?
    true
    # This is for already logged-in users.
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def search?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all.sample(6)
    end
  end
end
