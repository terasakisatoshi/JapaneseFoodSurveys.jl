function summarize()
    polldir = let
        pd = pkgdir(@__MODULE__)
        if isnothing(pd)
            pd = ""
        end
        joinpath(pd, "poll")
    end
    dirs = filter(p -> isdir(p), readdir(polldir, join=true))

    df = DataFrame(
        :favorite_food => String[],
    )

    for d in dirs
        tomlfile = joinpath(d, "Data.toml")
        try
            checktomlformat(tomlfile)
        catch e
            @warn "There is a format issue in $(tomlfile) $(e)"
            continue
        end
        toml = TOML.parsefile(tomlfile)
        push!(df, (; favorite_food=string(toml["favorite_food"])))
    end
    df
end
