default_githubuser() = LibGit2.getconfig("github.user", "")

struct MissingUserException <: Exception end
function Base.showerror(io::IO, ::MissingUserException)
    s = """Git hosting service username is required, set one with keyword `githubuser="<YourGitHubUserName>"`"""
    print(io, s)
end
