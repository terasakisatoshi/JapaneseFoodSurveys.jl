using JapaneseFoodSurveys
using Documenter

DocMeta.setdocmeta!(
    JapaneseFoodSurveys,
    :DocTestSetup,
    :(using JapaneseFoodSurveys);
    recursive=true,
)

makedocs(;
    modules=[JapaneseFoodSurveys],
    authors="Satoshi Terasaki <terasakisatoshi.math@gmail.com> and contributors",
    sitename="JapaneseFoodSurveys.jl",
    format=Documenter.HTML(;
        canonical="https://terasakisatoshi.github.io/JapaneseFoodSurveys.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md"
    ],
)

deploydocs(;
    repo="github.com/terasakisatoshi/JapaneseFoodSurveys.jl",
    devbranch="main",
)
