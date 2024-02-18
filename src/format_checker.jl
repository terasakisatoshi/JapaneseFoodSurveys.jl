struct DataFormatError <: Exception
    msg::AbstractString
end

function checktomlformat(tomlfile::AbstractString)
    toml = TOML.parsefile(tomlfile)
    ks = keys(toml)
    for (T, k) in REQUIRED_KEYS
        k in ks || throw(DataFormatError("Please add $(k) key."))
        value = toml[k]
        isvalid(T, value) || throw(DataFormatError("Invalid value=$(value) found."))
    end
    ks ⊆ [k for (T, k) in REQUIRED_KEYS] ||
        throw(DataFormatError("Unexpected key(s) $(setdiff(ks, REQUIRED_KEYS))"))
    for (k, v) in toml
        isempty(v) && throw(
            DataFormatError("The value for key \"$(k)\" is empty. Please add something."),
        )
    end
    return true
end
