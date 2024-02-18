using LibGit2
using REPL.TerminalMenus
using TOML

default_githubuser() = LibGit2.getconfig("github.user", "")

struct MissingUserException <: Exception end
function Base.showerror(io::IO, ::MissingUserException)
    s = """Git hosting service username is required, set one with keyword `githubuser="<YourGitHubUserName>"`"""
    print(io, s)
end

const FAVORITE_FOOD_OPTIONS = ["焼肉", "寿司", "麺類", "野菜"]

function interactive(; githubuser::Union{String,Nothing}=nothing)
    if isnothing(githubuser)
        githubuser = default_githubuser()::String
    end
    @info "githubuser=$githubuser"
    !isempty(githubuser) || throw(MissingUserException())

    try
        menu = RadioMenu(FAVORITE_FOOD_OPTIONS, pagesize=4)

        choice = request("Choose your favorite food:", menu)

        if choice != -1
            println("Your favorite food is ", FAVORITE_FOOD_OPTIONS[choice], "!")
        else
            println("Menu canceled.")
        end

        userworkspace = joinpath("poll", githubuser)
        mkpath(userworkspace)
        tomlfile = joinpath(userworkspace, "Data.toml")
        open(tomlfile, "w") do io
            TOML.print(io, Dict(:favorite_food => FAVORITE_FOOD_OPTIONS[choice]))
        end
        @info "tomlfile=$tomlfile has been created"
    catch e
        e isa InterruptException || rethrow()
        println()
        @info "Cancelled"
        return nothing
    end
end

interactive()
