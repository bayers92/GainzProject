class ScoreSearch < Lupa::Search
  class Scope

    def featured
      scope.where(lift_id: search_attributes[:lift_id])
    end
  end
end