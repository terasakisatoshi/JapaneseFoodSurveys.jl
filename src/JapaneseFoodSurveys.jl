module JapaneseFoodSurveys

using LibGit2
using TOML
using REPL.TerminalMenus
using DataFrames
# Write your package code here.
include("survey_contents.jl")
const REQUIRED_KEYS = [(FavoriteFood, "favorite_food")]

include("format_checker.jl")
include("github.jl")
include("stats.jl")

end
