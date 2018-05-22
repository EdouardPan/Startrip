class ProfilePolicy < ApplicationPolicy
  def dashboard?
    record.user == user
  end
  class Scope < Scope
    def resolve
      scope
      # No all. We don't want to list all the profiles.
    end
  end
end
