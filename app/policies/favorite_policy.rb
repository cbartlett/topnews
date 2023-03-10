class FavoritePolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end
end
