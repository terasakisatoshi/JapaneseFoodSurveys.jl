const FAVORITE_FOOD_OPTIONS = ["焼肉", "寿司", "麺類", "野菜"]
struct FavoriteFood end

function isvalid(::Type{FavoriteFood}, o)
    o ∈ FAVORITE_FOOD_OPTIONS
end
