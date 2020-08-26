class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all      
    end
  end

  def new?
    return true
  end
end
